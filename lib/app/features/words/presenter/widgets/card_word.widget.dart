import 'package:flutter/cupertino.dart';

class CardWord extends StatelessWidget {
  final String word;
  final void Function() onTap;
  const CardWord({super.key, required this.word, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(word),
      ),
    );
  }
}
