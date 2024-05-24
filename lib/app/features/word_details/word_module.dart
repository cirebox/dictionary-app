import 'package:flutter_modular/flutter_modular.dart';

import '../../core/infra/services/api/api_service.dart';
import 'domain/usecases/get_word.dart';
import 'external/datasource/word_datasource_impl.dart';
import 'infra/repositories/words_repository_impl.dart';
import 'presenter/word_page.dart';
import 'presenter/word_store.dart';

class WordModule extends Module {
  @override
  final List<Bind> binds = [
    //Datasources
    Bind.lazySingleton((i) => WordDatasourceImpl(i<ApiService>())),

    //Repositories
    Bind.lazySingleton((i) => WordRepositoryImpl(i<WordDatasourceImpl>())),

    //Usecases
    Bind.lazySingleton((i) => GetWordUsecaseImpl(i<WordRepositoryImpl>())),

    //store
    Bind.lazySingleton((i) => WordStore(i<GetWordUsecaseImpl>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '${Modular.initialRoute}:word',
      child: (_, args) => WordPage(
        word: args.params['word'],
      ),
    ),
  ];
}
