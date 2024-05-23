import 'exceptions.dart';

class ApiException extends Failure {
  ApiException(
    String message,
    int? statusCode,
    bool? tokenExpired, {
    dynamic exception,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          statusCode: statusCode,
          tokenExpired: tokenExpired,
          message: message,
        );
}
