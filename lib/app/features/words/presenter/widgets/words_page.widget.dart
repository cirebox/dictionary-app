import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/constants/words.constant.dart';
import 'card_word.widget.dart';

class WordsPageWidget extends StatefulWidget {
  const WordsPageWidget({super.key});

  @override
  State<WordsPageWidget> createState() => _WordsPageWidgetState();
}

class _WordsPageWidgetState extends State<WordsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return CardWord(
            word: words[index],
            onTap: () {
              Modular.to.pushNamed('/word_details/${words[index]}');
            },
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
