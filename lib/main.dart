import 'package:flutter/material.dart';
import 'package:wordle_app/common/di/get_it.dart';
import 'package:wordle_app/presentation/view/wordle_view.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WordleView(),
    );
  }
}
