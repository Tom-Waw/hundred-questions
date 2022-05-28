import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:hundred_questions/models/category.dart';
import 'package:hundred_questions/models/question.dart';

class CategoryProvider {
  List<Category> categories = [];

  CategoryProvider();

  void init(String seedURL) {
    WidgetsFlutterBinding.ensureInitialized();

    readJson(seedURL).then((categories) {
      this.categories = categories;
    });
  }

  Future<List<Category>> readJson(String seedURL) async {
    final response = await rootBundle.loadString("assets/seed_data.json");
    final data = await json.decode(response) as List;

    return data
        .mapIndexed((index, category) => Category(
              index.toString(),
              category["name"],
              category["questions"]
                  .map<Question>((question) => Question(question))
                  .toList(),
            ))
        .toList();
  }

  Category getCategoryById(String id) {
    return categories.firstWhere((category) => category.id == id);
  }
}
