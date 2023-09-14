import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_of_category_container.dart';

class MealsOfCategory extends StatefulWidget {
  MealsOfCategory({super.key, required this.title, required this.id});

  String title;
  String id;

  @override
  State<MealsOfCategory> createState() => _MealsOfCategoryState();
}

class _MealsOfCategoryState extends State<MealsOfCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(widget.title),
      ),
      body: Text('data'),

      //dummyMeals.map((meal) => MealOfCategoryContainer(meal: meal)).where((widget.id) => ),
    );
  }
}
