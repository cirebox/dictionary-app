import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../core/external/datasource/localstorage_impl.dart';
import 'widgets/card_word.widget.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({
    Key? key,
  }) : super(key: key);

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  var storage = Modular.get<LocalStorageDatasourceImpl>();

  @override
  void initState() {
    super.initState();
    loadFavorites();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late final List<String> words = [
    'hello',
    'world',
    'beautiful',
    'bye',
    'red',
    'blue',
    'green',
    'yellow',
    'black',
    'goodbye',
    'goodnight',
    'goodmorning',
    'goodafternoon',
    'goodnight',
    'goodday',
  ];

  String favorites = '';
  List<String> wordsFavorites = [];
  List<String> wordsHistory = [];

  void loadFavorites() async {
    wordsFavorites = [];
    favorites = await storage.load('favorites');
    wordsFavorites = words.map((e) => favorites.contains(e) ? e : '').toList();
    setState(() {
      wordsFavorites.removeWhere((element) => element.isEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.8,
          toolbarHeight: 40,
          title: const Text('Words Dictionary'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Word List',
                icon: Icon(Icons.text_rotation_none),
              ),
              Tab(
                text: 'History',
                icon: Icon(Icons.history),
              ),
              Tab(
                text: 'Favorites',
                icon: Icon(Icons.star_border),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _wordsList(),
            _history(),
            _favorites(),
          ],
        ),
      ),
    );
  }

  Widget _wordsList() {
    final inputFormat = DateFormat('dd/MM/yyyy hh:mm');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.6),
              ),
              child: CardWord(
                word: words[index],
                onTap: () {
                  setState(() {
                    wordsHistory.add(
                        '${words[index]} => ${inputFormat.format(DateTime.now())}');
                  });
                  Modular.to.pushNamed('/word_details/${words[index]}');
                },
              ),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }

  Widget _history() {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        return Future.value();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: wordsHistory.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.6),
                ),
                child: ListTile(
                  title: Text(wordsHistory[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _favorites() {
    final inputFormat = DateFormat('dd/MM/yyyy hh:mm');
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        return Future.value();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: wordsFavorites.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.6),
                ),
                child: CardWord(
                  word: wordsFavorites[index],
                  onTap: () {
                    setState(() {
                      wordsHistory.add(
                          '${wordsFavorites[index]} => ${inputFormat.format(DateTime.now())}');
                    });
                    Modular.to
                        .pushNamed('/word_details/${wordsFavorites[index]}');
                  },
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      ),
    );
  }
}
