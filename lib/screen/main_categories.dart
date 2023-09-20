import 'package:meal_app/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meals_of_category.dart';
import 'package:meal_app/widgets/category_container.dart';

class MainCategories extends StatefulWidget {
  MainCategories({super.key, required this.availableMeals});

  List<Meal> availableMeals;

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.fling();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Categoryy category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsofCategory(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: ((context, child) => SlideTransition(
            position:
                Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
                    .animate(CurvedAnimation(
                        parent: _animationController, curve: Curves.easeInOut)),
            child: child,
          )),
      child: Padding(
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
