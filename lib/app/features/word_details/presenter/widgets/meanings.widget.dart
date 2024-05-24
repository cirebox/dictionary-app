import 'package:flutter/material.dart';

import '../../domain/entities/word_entity.dart';
import 'button.widget.dart';

class MeaningsWidget extends StatefulWidget {
  final List<Meanings>? meanings;
  const MeaningsWidget({super.key, this.meanings});

  @override
  State<MeaningsWidget> createState() => _MeaningsWidgetState();
}

class _MeaningsWidgetState extends State<MeaningsWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < (widget.meanings?.length ?? 2) - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.meanings == null
        ? const Center(
            child: Text('Nenhuma definição encontrada'),
          )
        : Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: widget.meanings!.map((e) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.partOfSpeech ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: e.definitions!.map((e) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.definition ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  e.example != null
                                      ? Text(
                                          e.example!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        )
                                      : const SizedBox(),
                                  const SizedBox(height: 3),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _currentPage > 0
                          ? ButtonNavigation(
                              text: 'Voltar',
                              onTap: _goToPreviousPage,
                            )
                          : const SizedBox(),
                      _currentPage < (widget.meanings?.length ?? 2) - 1
                          ? ButtonNavigation(
                              text: 'Próximo',
                              onTap: _goToNextPage,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
