import 'package:dictionary/app/features/word_details/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../core/domain/errors/exceptions.dart';
import '../../../core/external/datasource/localstorage_impl.dart';
import 'widgets/card_phonetic.widget.dart';
import 'widgets/meanings.widget.dart';
import 'word_store.dart';

class WordPage extends StatefulWidget {
  final String? word;
  const WordPage({Key? key, this.word}) : super(key: key);

  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  var store = Modular.get<WordStore>();
  var storage = Modular.get<LocalStorageDatasourceImpl>();

  bool isFavorite = false;
  String favorites = '';
  @override
  void initState() {
    store.getWord(widget.word!);
    loadFavorites();
    super.initState();
  }

  @override
  void dispose() {
    Modular.dispose<WordStore>();
    super.dispose();
  }

  void loadFavorites() async {
    favorites = await storage.load('favorites');
    if (favorites.contains(widget.word!)) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.8,
          toolbarHeight: 50,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Modular.to.pop(),
          ),
          actions: [
            IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white),
              onPressed: () {
                if (isFavorite) {
                  favorites = favorites.replaceAll(widget.word!, '');
                } else {
                  favorites += widget.word!;
                }
                storage.save('favorites', favorites);
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: ScopedBuilder<WordStore, Failure, WordEntity>(
            store: store,
            onState: (_, word) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CardPhonetic(
                      word: word.word,
                      phoneticsText: word.phonetics?.last.text ?? '',
                    ),
                  ),
                  //Sound entra aqui

                  word.meanings?.length == 0
                      ? const Center(
                          child: Text('Nenhuma definição encontrada'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Meanings',
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              MeaningsWidget(meanings: word.meanings),
                            ],
                          ),
                        )
                ],
              );
            },
            onLoading: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            onError: (context, error) => const Center(
              child: Text(
                'Failed to list words',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
