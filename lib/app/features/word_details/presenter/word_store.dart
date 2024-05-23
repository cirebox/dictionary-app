import 'package:flutter_triple/flutter_triple.dart';
import '../../../core/domain/errors/exceptions.dart';
import '../../../core/either_adapter/dartz_either_adapter.dart';
import '../domain/entities/word_entity.dart';
import '../domain/usecases/get_words.dart';

class WordStore extends NotifierStore<Failure, WordEntity> {
  final IGetWordUsecase _getWord;
  WordStore(this._getWord) : super(WordEntity());

  Future<void> getWord(String word) async => executeEither(
        () => DartzEitherAdapter.adapter(
          _getWord(word),
        ),
      );
}
