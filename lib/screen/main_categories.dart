import 'package:meal_app/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meals_of_category.dart';
import 'package:meal_app/widgets/category_container.dart';

class MainCategories extends StatelessWidget {
  MainCategories({super.key, required this.onToggleFavourite});

  void Function(Meal meal) onToggleFavourite;

  void _selectCategory(BuildContext context, Categoryy category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsofCategory(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            //  availableCategories.map((category) =>
            //  CategoryContainer(category: category)).toList(),

            for (final category in availableCategories)
              CategoryContainer(
                category: category,
                onSelectCategory: () => _selectCategory(context, category),
              ),

            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
