import 'package:flutter/material.dart';
import 'widgets/favorites_page.widget.dart';
import 'widgets/history_page.widget.dart';
import 'widgets/words_page.widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.8,
          toolbarHeight: 40,
          title: const Text('Words Dictionary'),
          automaticallyImplyLeading: false,
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
          children: const [
            WordsPageWidget(),
            HistoryPage(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
