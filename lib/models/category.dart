import 'dart:math';

import 'question.dart';

class Category {
  late final String id;
  final String name;
  final List<Question> questions;

  Category(this.id, this.name, this.questions);

  Question? randomQuestion() {
    return questions.isEmpty
        ? null
        : questions.length == 1
            ? questions.first
            : questions[Random().nextInt(questions.length)];
  }
}
