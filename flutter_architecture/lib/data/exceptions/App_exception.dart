class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);
  String toString() {
    return '$_prefix$_message';
  }
}

class fetchDataException extends AppException {
  fetchDataException([String? message])
      : super(message, "Error During Exception");
}

class BadDataException extends AppException {
  BadDataException([String? message]) : super(message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "Unauthorized Request");
}
