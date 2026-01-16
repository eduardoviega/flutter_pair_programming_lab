import 'package:flutter/material.dart';
import 'package:flutter_pair_programming_lab/action/presentation/pages/action_page.dart';
import 'package:flutter_pair_programming_lab/di/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pair Programming Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ActionPage(),
    );
  }
}
