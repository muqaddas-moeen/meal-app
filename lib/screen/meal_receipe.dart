import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/meal_of_receipe.dart';

class MealReceipe extends StatefulWidget {
  MealReceipe({super.key, required this.title, required this.id});

  String title;
  String id;

  @override
  State<MealReceipe> createState() => _MealReceipeState();
}

class _MealReceipeState extends State<MealReceipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        //title: Text(widget.title),
      ),
      body: ListView(
        children: [
          for (final meal in dummyMeals)
            if (meal.id == widget.id) MealOfReceipe(meal: meal)
        ],
      ),
    );
  }
}
