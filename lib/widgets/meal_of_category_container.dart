import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_receipe.dart';

class MealOfCategoryContainer extends StatelessWidget {
  MealOfCategoryContainer({super.key, required this.meal});

  Meal meal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MealReceipe(title: meal.title, id: meal.id)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        width: 300,
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(meal.imageUrl),
            //opacity: 1.7,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 112, 8, 8).withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 5,
                spreadRadius: -10)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: Container(
            color: Colors.black54,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        meal.title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.duration.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.work_outline_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.complexity.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.attach_money_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.affordability.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
