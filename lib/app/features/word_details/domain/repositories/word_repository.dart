import 'package:dartz/dartz.dart';
import '../../../../core/domain/errors/exceptions.dart';
import '../entities/word_entity.dart';

abstract class WordRepository {
  Future<Either<Failure, WordEntity>> getWord(String word);
}
