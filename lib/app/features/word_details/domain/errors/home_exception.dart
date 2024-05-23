import '../../../../core/domain/errors/exceptions.dart';

class WordException extends Failure {
  WordException(String message, {StackTrace? stackTrace})
      : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class WordDatasourceException extends WordException {
  WordDatasourceException(String message, {StackTrace? stackTrace})
      : super(
          message,
          stackTrace: stackTrace,
        );
}

class WordRepositoryException extends WordException {
  WordRepositoryException(String message, {StackTrace? stackTrace})
      : super(
          message,
          stackTrace: stackTrace,
        );
}
