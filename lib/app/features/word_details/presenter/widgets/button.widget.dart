import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonNavigation({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 100),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
