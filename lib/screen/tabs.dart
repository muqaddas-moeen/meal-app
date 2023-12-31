import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favourite_meal_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screen/main_categories.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screen/meals_of_category.dart';
import 'package:meal_app/screen/meal_receipe.dart';
import 'package:meal_app/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.veganFree: false,
  Filter.vegatarianFree: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      setState(() {
        Map<Filter, bool> result = {
          Filter.glutenFree: kGlutenFree,
          Filter.lactoseFree: kLactoseFree,
          Filter.veganFree: kVeganFree,
          Filter.vegatarianFree: kVegatarianFree
        };

        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegatarianFree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = MainCategories(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick your category';

    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsofCategory(
        meals: favouriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle,
              style: GoogleFonts.pacifico(
                  color: const Color.fromARGB(255, 163, 23, 13))),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 163, 23, 13),
          selectedFontSize: 12,
          unselectedItemColor: const Color.fromARGB(255, 134, 153, 163),
          unselectedFontSize: 10,
          unselectedLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 134, 153, 163)),
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
        endDrawer: MyDrawer(onSelectScreen: _setScreen));
  }
}
