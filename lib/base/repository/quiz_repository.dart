import 'package:word_prime/base/base_firestore.dart';
import 'package:word_prime/export.dart';
import 'dart:math';

class QuizRepository {
  /// Creates Firestore database object.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Object representing the currently logged in user.
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  /// Logger object for logging operations,
  var _logger = Logger(printer: PrettyPrinter());

  /// The data of the added_words subcollection is fetched from the firestore
  /// and returned as List<AddedWordModel?>.
  Future<List<AddedWordModel?>> fetchAddedWords() async {
    _logger.i("-fetchAddedWords- ENTERED");
    final allAddedWords = await BaseFirestore<AddedWordModel>().fetchAllItems(
      mainCollection: 'users',
      subCollection: 'added_words',
      model: AddedWordModel(),
      userId: _currentUser?.uid,
    );
    return allAddedWords;
  }

  /// The data of the added_words_quiz subcollection is fetched from the firestore
  ///  and returned as List<QuestionModel?>
  Future<List<QuestionModel?>> fetchAddedWordsQuiz() async {
    _logger.i("-fetchAddedWordsQuiz- ENTERED");
    final allAddedWordsQuizzes =
        await BaseFirestore<QuestionModel>().fetchAllItems(
      mainCollection: 'users',
      subCollection: 'added_words_quiz',
      model: QuestionModel(),
      userId: _currentUser?.uid,
    );
    return allAddedWordsQuizzes;
  }

  /// Creates new questions as a result of checking whether there are new words.
  Future<(bool, Map<String?, int>)> newQuestionGeneration() async {
    _logger.i("-newQuestionGeneration- ENTERED");

    /// Fetch added words.
    final allAddedWords = await fetchAddedWords();

    /// Count words by level
    Map<String?, int> levelCounts = {
      'A1': 0,
      'A2': 0,
      'B1': 0,
      'B2': 0,
      'C1': 0,
      'C2': 0,
    };

    for (var word in allAddedWords) {
      if (word != null && levelCounts.containsKey(word.wordLevel)) {
        levelCounts[word.wordLevel] = levelCounts[word.wordLevel]! + 1;
      }
    }

    /// Added word count check returns false if less than 3
    /// prints the warning message to the terminal with logger.
    if (allAddedWords.length < 3) {
      _logger.e("not enough words. quiz not created");
      return (false, levelCounts);
    }

    /// Fetch user quiz questions.
    final userQuizQuestions = await fetchAddedWordsQuiz();

    /// Important: 'questionId' is the firestore equivalent 'wordId' value.
    /// 'existingQuizWordIds' assigns the word ids of existing quiz questions.
    /// toSet() automatically eliminates duplicate elements.
    final existingQuizWordIds =
        userQuizQuestions.map((quiz) => quiz?.questionId).toSet();

    /// From the items in the 'allAddedWords' list, selects words not in the
    /// 'existingQuizWordIds' set and assigns 'newWordsList'.
    final newWordsList = allAddedWords
        .where((word) => !existingQuizWordIds.contains(word?.addedWordId))
        .toList();

    /// If there is no new word, i.e. 'newWordsList' is empty,
    /// it returns false.
    if (newWordsList.isEmpty) {
      return (false, levelCounts);
    }

    /// '_createQuizForWords' creates a quiz question for the new words.
    await _createQuizForWords(
      newWordsList,
      allAddedWords,
    );

    /// '_createQuizForWords' returns true if successful
    return (true, levelCounts);
  }

  /// Create question for quiz.
  Future<void> _createQuizForWords(
    List<AddedWordModel?> newWords,
    List<AddedWordModel?> allWords,
  ) async {
    _logger.i("-_createQuizForWords- ENTERED");

    /// 'word' refers to each new word pattern.
    for (var word in newWords) {
      /// For new words, it creates the wrong answers to the question from other
      /// words with _getRandomWrongAnswers and assigns wrongAnswers.
      final List<String> wrongAnswers = _getRandomWrongAnswers(
        allWords: allWords,
        correctWord: word,
        count: 2,
      );

      /// Populates the question model with the content of each new word model.
      final question = QuestionModel(
        /// questionId is the id of the word that forms the question is given.
        questionId: word?.addedWordId,

        /// questionWord is given the English word value from the word model that forms the question
        questionWord: word?.wordEn,

        /// answerWord is given the Turkish word value from the word model that forms the question.
        answerWord: word?.wordTr,

        /// questionImageAddress is given the wordImageAddress value from the word model that forms the question.
        questionImageAddress: word?.wordImageAddress,

        /// questionImageAddress is given the questionLevel value from the word model that forms the question.
        questionLevel: word?.wordLevel,

        /// isAnswered value is initially set to false.
        isAnswered: false,

        /// The isTrue value is given a null value because the question has not been solved yet.
        isTrue: null,

        /// The 'options' value is given a mixed state of False and True options.
        options: [word?.wordTr, ...wrongAnswers]..shuffle(),
      );

      /// If '_currentUser?.uid' and 'word?.addedWordId' are not null, they are
      /// added to the 'added_words_quiz' subcollection with the question model.
      if (_currentUser?.uid != null && word?.addedWordId != null) {
        try {
          await _firestore
              .collection('users')
              .doc(_currentUser!.uid)
              .collection('added_words_quiz')
              .doc(word!.addedWordId)
              .set(question.toJson());
          _logger.i("question completed successfully");
        } catch (e) {
          _logger.e("_createQuizForWords() error: $e");
        }
      }
    }
  }

  /// It randomly selects the wrong options from the words added by the user.
  List<String> _getRandomWrongAnswers({
    required List<AddedWordModel?> allWords,
    required AddedWordModel? correctWord,
    required int count,
  }) {
    /// Extract the correct word from existing words
    /// and is assigned to the variable 'availableWords'.
    var availableWords = allWords
        .where((w) => w?.addedWordId != correctWord?.addedWordId)
        .toList();

    /// A list is defined to put the selected words
    final selectedWords = <String>[];

    /// Random object is created to make random selection
    final random = Random();

    /// If the number of elements of the selectedWords list is less than
    /// the given count value, the action is taken.
    while (selectedWords.length < count) {
      /// Returns a random number between 0 and 'availableWords.length'.
      final randomIndex = random.nextInt(availableWords.length);

      /// Gets the randomly selected word at randomIndex from the 'availableWords' list.
      /// The 'word' variable is an AddedWordModel? becomes an object of type .
      final word = availableWords[randomIndex];

      /// If 'word?.wordTr' is not null, i.e. a valid word.
      /// If this word has not been added to the 'selectedWords' list before.
      if (word?.wordTr != null && !selectedWords.contains(word!.wordTr)) {
        /// If the condition is met, the 'word.wordTr' value is added to the selectedWords list.
        selectedWords.add(word.wordTr!);
      }

      /// Remove selected word from list
      availableWords.removeAt(randomIndex);

      /// If there are no more words to choose from in the list, end the loop.
      if (availableWords.isEmpty) break;
    }

    _logger.i("incorrect options were created successfully");

    /// Returns the added words, these words will be used as wrong options
    return selectedWords;
  }

  /// Returns Quiz questions filtered by question_level value and
  /// with is_answered false status.
  Future<List<QuestionModel?>> fetchAddedWordsQuizByLevel({
    required String? questionLevel,
  }) async {
    _logger.i("-fetchAddedWordsQuizByLevel- ENTERED");
    final allAddedWordsQuizzes = await BaseFirestore<QuestionModel>()
        .fetchFilteredAllItems(
            mainCollection: 'users',
            subCollection: 'added_words_quiz',
            model: QuestionModel(),
            userId: _currentUser?.uid,
            filters: {
          "question_level": questionLevel,
          "is_answered": false,
        });
    return allAddedWordsQuizzes;
  }
}
