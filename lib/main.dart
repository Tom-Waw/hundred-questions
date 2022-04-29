import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "100 Questions"),
    );
  }
}

extension RandomListItem<T> on List<T> {
  T? randomItem() => isEmpty
      ? null
      : length == 1
          ? first
          : this[Random().nextInt(length)];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _currentQuestion;
  final List<String> _questions = [
    "Test 1",
    "Test 2",
    "Test 3",
    "Test 4",
    "Test 5",
  ];

  @override
  void initState() {
    super.initState();
    _selectQuestion();
  }

  void _selectQuestion() {
    setState(() {
      _currentQuestion = _questions.randomItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _selectQuestion,
        child: Center(
          child: Text(
            _currentQuestion ?? "",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
