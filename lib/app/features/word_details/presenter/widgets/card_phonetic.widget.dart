import 'package:flutter/material.dart';

class CardPhonetic extends StatelessWidget {
  final String? word;
  final String? phoneticsText;
  const CardPhonetic({
    super.key,
    required this.word,
    required this.phoneticsText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text(word ?? '')),
          Center(child: Text(phoneticsText ?? '')),
        ],
      ),
    );
  }
}
