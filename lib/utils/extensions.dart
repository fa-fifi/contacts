extension StringHelper on String {
  /// Returns the first character of each word.
  String getInitials() => isNotEmpty
      ? trim().split(RegExp(' +')).map((str) => str[0]).take(2).join()
      : '';
}
