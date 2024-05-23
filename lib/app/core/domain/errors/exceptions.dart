import 'package:flutter/foundation.dart';

import '../../infra/services/report_error/report_error_service.dart';

abstract class Failure {
  final String message;
  final int? statusCode;
  final bool? tokenExpired;
  Failure({
    dynamic exception,
    StackTrace? stackTrace,
    String? label,
    this.statusCode,
    this.tokenExpired,
    this.message = '',
  }) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
    ErrorReport.externalFailureError(exception, stackTrace, label);
  }
}

abstract class INotInternetConnection extends Failure {
  INotInternetConnection() : super(message: 'No Internet Connection');
}

class UnknownError extends Failure {
  UnknownError({
    String message = 'Unknown Error',
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          message: message,
        );
}

class NotInternetConnection extends INotInternetConnection {}

class NotDataFound extends Failure {}

class FailureRequest extends Failure {
  FailureRequest({
    String message = 'Falha ao realizar requisição',
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          message: message,
        );
}

class Unauthorized extends Failure {
  Unauthorized({
    String message = 'Usuário não autorizado',
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          message: message,
        );
}

class InvalidValue extends Failure {}

class DatasourceResultNull extends Failure {}
