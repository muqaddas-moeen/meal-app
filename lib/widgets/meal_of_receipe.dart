import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealOfReceipe extends StatelessWidget {
  MealOfReceipe({super.key, required this.meal});

  Meal meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        meal.title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Hero(
                        tag: meal.id,
                        child: CircleAvatar(
                          minRadius: 70.0,
                          maxRadius: 90.0,
                          backgroundColor: Colors.deepPurple,
                          backgroundImage: NetworkImage(meal.imageUrl),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingredient in meal.ingredients) Text(ingredient),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Steps',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final steps in meal.steps) Text(steps),
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              '--------------------------',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ))
          ]),
    );
  }
}
