import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourite_meal_provider.dart';
import 'package:meal_app/widgets/meal_of_receipe.dart';

class MealReceipe extends ConsumerWidget {
  MealReceipe({super.key, required this.meal});
  Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFav = false;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favouriteMealsProvider.notifier)
                    .toggleMealFavouriteStatus(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? 'Added to your favourites'
                        : 'Removed your favourites')));
                isFav = wasAdded;
              },
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animate) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.8, end: 1).animate(animate),
                    child: child,
                  );
                },
                child: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  key: ValueKey(isFav),
                ),
              ),
            )
          ],
        ),
        body: ListView(children: [MealOfReceipe(meal: meal)]));
  }
}
