import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final PageController controller;
  const AppBottomNav({required this.controller,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: color,
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //home icon
            IconButton(
                onPressed: () => controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
                iconSize: 32,
                icon: const Icon(Icons.home)
            ),
            //book mark icon
            IconButton(
                onPressed: () => controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
                iconSize: 32,
                icon: const Icon(Icons.bookmark)
            ),
          ],
        ),
      ),
    );
  }
}
