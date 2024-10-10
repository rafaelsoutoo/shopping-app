class HttpExeption implements Exception {
  final String message;
  final int statusCode;

  HttpExeption({
    required this.message,
    required this.statusCode,
  });

  @override
  String toString() {
    return message;
  }
}
