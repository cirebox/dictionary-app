import 'package:flutter/material.dart';

class MeaningsWidget extends StatefulWidget {
  final List<String> meanings;
  const MeaningsWidget({super.key, this.meanings = const []});

  @override
  State<MeaningsWidget> createState() => _MeaningsWidgetState();
}

class _MeaningsWidgetState extends State<MeaningsWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: widget.meanings.map((value) => Text(value)).toList(),
    );
  }
}
