import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/domain/errors/exceptions.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/errors/home_exception.dart';
import '../../domain/repositories/word_repository.dart';
import '../adapters/word_adapter.dart';
import '../datasources/words_datasource.dart';

@Injectable()
class WordRepositoryImpl implements WordRepository {
  final WordDatasource datasource;

  WordRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, WordEntity>> getWord(String word) async {
    try {
      final result = await datasource.getWord(word);
      final data = WordAdapter.fromJson(result[0]);
      return right(data);
    } on WordRepositoryException catch (exception) {
      return left(exception);
    } catch (exception, stacktrace) {
      if (kDebugMode) {
        print(exception);
        print(stacktrace);
      }
      return left(
        WordRepositoryException(
          'Failed to get word.',
          stackTrace: stacktrace,
        ),
      );
    }
  }
}
