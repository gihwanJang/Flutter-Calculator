import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(CalculaterApp());

// 뼈대
class CalculaterApp extends StatelessWidget {
  const CalculaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
