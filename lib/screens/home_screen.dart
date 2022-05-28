import 'package:flutter/material.dart';
import 'package:hundred_questions/models/category.dart';
import 'package:hundred_questions/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Category> categories;

  const HomeScreen(this.categories, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 140.0,
        title: Image.asset(
          "assets/images/cloud_logo.PNG",
          height: 125.0,
        ),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_dawn.PNG"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categories
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: CategoryCard(category),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
