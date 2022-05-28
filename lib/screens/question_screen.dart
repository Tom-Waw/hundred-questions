import 'package:flutter/material.dart';

import 'package:hundred_questions/models/category.dart';
import 'package:hundred_questions/models/question.dart';

class QuestionScreen extends StatefulWidget {
  final Category category;

  const QuestionScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Question? _currentQuestion;

  @override
  void initState() {
    super.initState();
    _selectQuestion();
  }

  void _selectQuestion() {
    setState(() {
      _currentQuestion = widget.category.randomQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 120.0,
        title: Image.asset(
          "assets/images/cloud_logo.PNG",
          height: 100,
        ),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_dawn.PNG"),
          ),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _selectQuestion,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 45.0,
                    horizontal: 25.0,
                  ),
                  child: Text(
                    _currentQuestion!.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff101442),
                      fontSize: 26,
                      fontFamily: "Futura",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
