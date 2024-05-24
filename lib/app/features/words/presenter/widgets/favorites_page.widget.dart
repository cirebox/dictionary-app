import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/constants/words.constant.dart';
import '../../../../core/external/datasource/localstorage_impl.dart';
import 'card_word.widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  var storage = Modular.get<LocalStorageDatasourceImpl>();

  List<String> wordsFavorites = [];

  String favorites = '';
  void loadFavorites() async {
    wordsFavorites = [];
    favorites = await storage.load('favorites');
    wordsFavorites = words.map((e) => favorites.contains(e) ? e : '').toList();
    setState(() {
      wordsFavorites.removeWhere((element) => element.isEmpty);
    });
  }

  @override
  void initState() {
    super.initState();
    loadFavorites();
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
          itemCount: wordsFavorites.length,
          itemBuilder: (context, index) {
            return CardWord(
              word: wordsFavorites[index],
              onTap: () {
                Modular.to.pushNamed('/word_details/${wordsFavorites[index]}');
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
