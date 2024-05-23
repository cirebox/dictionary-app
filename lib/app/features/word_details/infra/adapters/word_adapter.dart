import '../../../../core/util/utils.dart';
import '../../domain/entities/word_entity.dart';

class WordAdapter {
  static WordEntity fromJson(dynamic data) {
    if (Utils.isNullOrEmpty(data)) return WordEntity();
    return WordEntity.fromJson(data);
  }
}
