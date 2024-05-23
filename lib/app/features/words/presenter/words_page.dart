import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words Dictionary'),
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
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }

  Widget _wordsList() {
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
}
