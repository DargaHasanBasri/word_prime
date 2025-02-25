import 'package:word_prime/export.dart';

class QuizAnalysisRepository {
  /// Reference to the 'users' collection in Firestore
  final _userCollectionReference = FirebaseCollections.users.reference;

  /// Object representing the currently logged in user.
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  /// Logger object for logging operations,
  var _logger = Logger(printer: PrettyPrinter());

  /// Returns weekly quiz analysis data.
  /// The quizLevel parameter is used to filter quizzes belonging to a certain level.
  Future<List<QuizAnalysisModel?>> fetchQuizAnalysis({
    String? quizLevel,
  }) async {
    try {
      /// Checking whether the user is logged in or not.
      if (_currentUser?.uid == null) {
        /// If the user is not logged in, the error message is logged
        /// and a 7-element list, all null, is returned.
        _logger.e('No user logged in');

        /// Returns an empty list for one week of data
        return List.filled(7, null);
      }

      /// The current date and time are retrieved.
      /// This is used to determine which week to analyze.
      final DateTime now = DateTime.now();

      /// It is calculated on Monday, which is the starting day of the week.
      final DateTime monday = now.subtract(Duration(days: now.weekday - 1));

      /// The start (weekStart) and end (weekEnd) dates of the week are determined.
      final DateTime weekStart = DateTime(
        monday.year,
        monday.month,
        monday.day,
      );
      final DateTime weekEnd = weekStart.add(
        const Duration(
          days: 6,
          hours: 23,
          minutes: 59,
          seconds: 59,
        ),
      );

      /// If quizLevel is not specified, the 'analysis_all_daily' subcollection is used.
      String subCollectionName = 'analysis_all_daily';

      /// If quizLevel is specified, the 'quiz_analysis' subcollection is used.
      if (quizLevel != null && quizLevel.isNotEmpty) {
        subCollectionName = 'quiz_analysis';
      }

      /// Creates the base collection reference for the Firestore query.
      /// Data will be pulled from the relevant collection according to the user's UID.
      final baseQuery = _userCollectionReference
          .doc(_currentUser!.uid)
          .collection(subCollectionName)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return QuizAnalysisModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      );

      /// Documents whose quiz_date field is between weekStart and weekEnd are filtered.
      /// Sorting is done by quiz date (older dates come first).
      var query = baseQuery
          .where('quiz_date', isGreaterThanOrEqualTo: weekStart)
          .where('quiz_date', isLessThanOrEqualTo: weekEnd)
          .orderBy('quiz_date', descending: false);

      /// If quizLevel is specified , quiz_level condition is also added to the query .
      if (quizLevel != null && quizLevel.isNotEmpty) {
        query = query.where('quiz_level', isEqualTo: quizLevel);
      }

      /// Data is pulled asynchronously from Firestore.
      final querySnapshot = await query.get();

      /// A list with 7 elements, null by default, is created.
      /// To store data from Firestore in weeklyData.
      List<QuizAnalysisModel?> weeklyData = List.filled(7, null);

      for (var doc in querySnapshot.docs) {
        final quizData = doc.data();
        if (quizData != null) {
          /// The quiz_date field in the document is
          /// being converted from Timestamp format to DateTime format.
          final Timestamp timestamp = doc.get('quiz_date') as Timestamp;
          final DateTime quizDate = timestamp.toDateTime();

          /// The day of the QuizDate date is
          /// calculated in order of the start day of the week (weekStart).
          final dayIndex = quizDate.difference(weekStart).inDays;
          if (dayIndex >= 0 && dayIndex < 7) {
            weeklyData[dayIndex] = quizData;
          }
        }
      }

      /// After the process is completed successfully,
      /// it prints the log message and returns a weeklyData list.
      _logger.i('Success weeklyData!');
      return weeklyData;
    } catch (e) {
      /// If an error occurs, the error message is logged and
      /// returns a 7-element list, all null.
      _logger.e('Error fetching quiz analysis: $e');
      return List.filled(7, null);
    }
  }
}
