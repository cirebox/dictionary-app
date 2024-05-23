import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/external/datasource/localstorage_impl.dart';
import 'core/infra/services/api/api_service.dart';
import 'features/word_details/word_module.dart';
import 'features/words/words_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind.lazySingleton((i) => ApiService(i<Dio>())),
        Bind.lazySingleton((i) => LocalStorageDatasourceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          duration: const Duration(milliseconds: 600),
          transition: TransitionType.rightToLeft,
          module: WordsModule(),
        ),
        ModuleRoute(
          '/word_details',
          duration: const Duration(milliseconds: 600),
          transition: TransitionType.rightToLeftWithFade,
          module: WordModule(),
        ),
      ];
}
