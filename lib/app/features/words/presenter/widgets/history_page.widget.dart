import 'package:flutter/material.dart';

import '../../../../core/util/words_history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        return Future.value();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: wordsHistory.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 0.6),
                ),
                child: ListTile(
                  title: Text(wordsHistory[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
