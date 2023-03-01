abstract class CustomException implements Exception {
  final int code;
  final String message;

  CustomException(this.code, this.message);
}

class RemoteException extends CustomException {
  static const other = -1;
  static const receiveTimeout = 0;
  static const connectTimeout = 1;
  static const sendTimeout = 2;
  static const responseError = 3;
  static const cancelRequest = 4;
  static const socketError = 5;
  static const noInternet = 6;
  static const downloadError = 7;
  static const badCertification = 8;

  final int errorCode;
  final int? httpStatusCode;
  final String errorMessage;

  RemoteException(this.errorCode, this.errorMessage, {this.httpStatusCode})
      : super(errorCode, errorMessage);
}

class LocalException extends CustomException {
  static const other = -1;
  static const emptyUser = 0;
  static const unkownUser = 1;

  final int errorCode;
  final String errorMessage;

  LocalException(this.errorCode, this.errorMessage)
      : super(errorCode, errorMessage);
}
