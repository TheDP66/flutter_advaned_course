import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      height: 70,
      color: Colors.black54,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              color: Colors.white70,
              onPressed: () {
                controller.animateToPage(
                  0,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeIn,
                );
              },
              icon: const Icon(Icons.home),
            ),
            const SizedBox(),
            IconButton(
              color: Colors.white70,
              onPressed: () {
                controller.animateToPage(
                  1,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeIn,
                );
              },
              icon: const Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
    );
  }
}
