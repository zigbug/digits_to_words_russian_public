class DigitsToWordsRussianParserException implements Exception {
  final String? message;

  DigitsToWordsRussianParserException({this.message});
  @override
  String toString() {
    if (message != null) {
      return '$runtimeType: ${message!}';
    } else {
      return super.toString();
    }
  }
}
