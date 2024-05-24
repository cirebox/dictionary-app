import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/words.constant.dart';
import '../../../../core/external/datasource/localstorage_impl.dart';
import 'card_word.widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var storage = Modular.get<LocalStorageDatasourceImpl>();

  List<String> wordsHistory = [];

  String history = '';
  void loadHistory() async {
    wordsHistory = [];
    history = await storage.load('history');
    wordsHistory = words.map((e) => history.contains(e) ? e : '').toList();
    setState(() {
      wordsHistory.removeWhere((element) => element.isEmpty);
    });
  }

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        return Future.value();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: wordsHistory.length,
          itemBuilder: (context, index) {
            return CardWord(
              word: wordsHistory[index],
              onTap: () {
                Modular.to.pushNamed('/word_details/${wordsHistory[index]}');
              },
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ),
    );
  }
}
