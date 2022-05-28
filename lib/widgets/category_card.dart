import 'package:flutter/material.dart';
import 'package:hundred_questions/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        "/category/${category.id}",
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xffDA947F),
                offset: Offset(8.0, 8.0),
                blurStyle: BlurStyle.solid,
              )
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff606c95),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Level X",
                        style: TextStyle(
                          color: Color(0xff233667),
                          fontFamily: "Futura",
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      category.name,
                      style: const TextStyle(
                        color: Color(0xff101442),
                        fontFamily: "Futura",
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
