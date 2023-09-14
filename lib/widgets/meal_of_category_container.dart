import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealOfCategoryContainer extends StatelessWidget {
  MealOfCategoryContainer({super.key, required this.meal});

  Meal meal;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Image(
            image: AssetImage('assets/images/italian.jpg'),
            height: 200,
            width: 320,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Container(
            height: 100,
            width: 320,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 75, 66, 66),
                backgroundBlendMode: BlendMode.lighten),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        meal.title,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.alarm,
                        color: Colors.white,
                      ),
                      Text(
                        meal.duration.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.work,
                        color: Colors.white,
                      ),
                      Text(
                        meal.complexity.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.currency_exchange,
                        color: Colors.white,
                      ),
                      Text(
                        meal.affordability.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
