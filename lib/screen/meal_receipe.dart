import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

import 'package:meal_app/widgets/meal_of_receipe.dart';

class MealReceipe extends StatelessWidget {
  MealReceipe({super.key, required this.meal, required this.onToggleFavourite});
  Meal meal;
  void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                onToggleFavourite(meal);
              },
            )
          ],
        ),
        body: ListView(children: [MealOfReceipe(meal: meal)]));
  }
}
