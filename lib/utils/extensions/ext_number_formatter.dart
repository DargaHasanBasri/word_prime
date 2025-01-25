/// It is a special extension for the int type.
/// It abbreviates large numbers (1000 and above)
/// in a more readable format.

extension NumberFormatter on int {
  /// Returns numbers in abbreviated form.
  String formatCount() {
    /// If the number is greater than 999,
    /// it is converted to "K" (thousand) format.
    if (this > 999) {
      /// Converts the number to "K" format by dividing
      /// it by 1000 and rounds off its decimal places.
      return '${(this / 1000).toStringAsFixed(0)}K';
    }

    /// If the number is 999 or less, it is returned as is.
    return '$this';
  }
}
