import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/errors/exceptions.dart';
import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

abstract class IGetWordUsecase {
  Future<Either<Failure, WordEntity>> call(String word);
}

@Injectable()
class GetWordUsecaseImpl implements IGetWordUsecase {
  final WordRepository repository;

  GetWordUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, WordEntity>> call(String word) async {
    return await repository.getWord(word);
  }
}
