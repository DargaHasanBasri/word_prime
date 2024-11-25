extension NumberFormatter on int {
  String formatCount() {
    if (this > 999) {
      return '${(this / 1000).toStringAsFixed(0)}K';
    }
    return '$this';
  }
}
