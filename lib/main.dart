import 'package:flutter/material.dart';

import 'package:hundred_questions/screens/home_screen.dart';
import 'package:hundred_questions/screens/loading_screen.dart';
import 'package:hundred_questions/screens/question_screen.dart';
import 'package:hundred_questions/services/category_provider.dart';

void main() {
  runApp(HundredQuestions());
}

class HundredQuestions extends StatelessWidget {
  final CategoryProvider categoryProvider = CategoryProvider();

  HundredQuestions({Key? key}) : super(key: key) {
    categoryProvider.init("assets/seed.json");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "100 Question",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == null) return null;

        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(
              builder: (context) => HomeScreen(categoryProvider.categories));
        }

        // Handle '/category/:id'
        Uri uri = Uri.parse(settings.name as String);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == "category") {
          String id = uri.pathSegments[1];
          print(id);
          return MaterialPageRoute(
              builder: (context) => QuestionScreen(
                  category: categoryProvider.getCategoryById(id)));
        }

        return null;
      },
      home: FutureBuilder<String>(
        future: Future<String>.delayed(
          const Duration(milliseconds: 2500),
          () => "loaded",
        ),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(categoryProvider.categories);
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              ),
            );
          } else {
            return const LoadingScreen();
          }
        },
      ),
    );
  }
}
