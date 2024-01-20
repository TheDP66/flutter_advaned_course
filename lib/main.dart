import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/locator.dart';

import 'core/widgets/main_wrapper.dart';

void main() async {
  /// inject dependency
  await setup();

  runApp(
    MaterialApp(
      title: 'flutter_advanced_course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainWrapper(),
    ),
  );
}
