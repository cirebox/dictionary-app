import 'package:flutter/material.dart';

class CardWord extends StatelessWidget {
  final String word;
  final void Function() onTap;
  const CardWord({super.key, required this.word, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Center(
            child: Text(
              word,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
