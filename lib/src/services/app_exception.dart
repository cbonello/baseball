class AppException implements Exception {
  const AppException(this.message);

  factory AppException.from(Exception exception) {
    if (exception is AppException) {
      return exception;
    }

    return AppException.fromCode('ERROR_UNKNOWN');
  }

  factory AppException.fromCode(String code) {
    switch (code) {
      case 'FirebaseException':
        return Exception('No Internet connection');
      default:
        return Exception('Unknown error');
    }
  }

  final String message;

  @override
  String toString() => 'AppException($message)';
}
