import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meals_of_category.dart';
import 'package:meal_app/data/dummy_data.dart';

class CategoryContainer extends StatelessWidget {
  CategoryContainer(
      {super.key, required this.category, required this.onSelectCategory});

  Categoryy category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      child: Container(
        margin: EdgeInsets.only(
            left: category.leftMargin, right: category.rightMargin, top: 20),
        width: 250,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(category.image),
            opacity: 1.7,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 112, 8, 8).withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 5,
                spreadRadius: -10)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              category.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
