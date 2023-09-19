import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_receipe.dart';
import 'package:meal_app/widgets/meal_of_category_container.dart';
import 'package:meal_app/widgets/meal_of_receipe.dart';

class MealsofCategory extends StatelessWidget {
  MealsofCategory(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavourite});

  final String? title;
  final List<Meal> meals;
  void Function(Meal meal) onToggleFavourite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealReceipe(
          meal: meal,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealOfCategoryContainer(
                meal: meals[index],
                onSelectMeal: (meal) => selectMeal(context, meal),
              ));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(title!),
      ),
      body: content,

      // ListView(
      //   children: [
      //     if (dummyMeals.isNotEmpty)
      //       for (final meal in dummyMeals)
      //         for (final id in meal.categories)
      //           if (id == widget.id)
      //             MealOfCategoryContainer(meal: meal)
      //           else if (dummyMeals.isEmpty)
      //             const Center(
      //               child: Text(
      //                 'Oh nothing is there!',
      //                 style:
      //                     TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //   ],
      // ),
    );
  }
}
