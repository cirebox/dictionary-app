import 'package:dictionary/app/features/word_details/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../core/domain/errors/exceptions.dart';
import 'widgets/card_phonetic.widget.dart';
import 'word_store.dart';

class WordPage extends StatefulWidget {
  final String? word;
  const WordPage({Key? key, this.word}) : super(key: key);

  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  var store = Modular.get<WordStore>();

  @override
  void initState() {
    store.getWord(widget.word!);
    super.initState();
  }

  @override
  void dispose() {
    Modular.dispose<WordStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: ScopedBuilder<WordStore, Failure, WordEntity>(
          store: store,
          onState: (_, word) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CardPhonetic(
                    word: word.word,
                    phoneticsText: word.phonetics?.last.text,
                  ),
                ),
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
    );
  }
}
