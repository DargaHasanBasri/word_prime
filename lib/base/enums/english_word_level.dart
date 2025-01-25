/// It is an enum class that specifies the level for English words.
/// Classification is made according to CEFR levels (A1, A2, B1, B2, C1, C2)
/// and mixed level.
enum EnglishWordLevel {
  /// Basic level beginner level.
  A1,

  /// Basic level intermediate level.
  A2,

  /// Intermediate beginner level.
  B1,

  /// Intermediate advanced level.
  B2,

  /// Advanced beginner level.
  C1,

  /// Advanced professional level.
  C2,

  /// Mixed level words (can contain words from all levels).
  Mix;

  /// A getter that returns the name of the selected level in String type.
  String get level => name;
}
