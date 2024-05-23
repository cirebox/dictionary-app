import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/words_page.dart';

class WordsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const WordsPage(),
    ),
  ];
}
