import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/main_categories.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screen/meals_of_category.dart';
import 'package:meal_app/screen/meal_receipe.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
// Filtered Meals Setting
    bool _toggleState = false;
    String _switchCase = '';
    bool isSwitched = false;

    void _attemptChange(bool newState) {
      setState(() {
        _toggleState = newState;
        newState ? _switchCase = 'ON' : _switchCase = 'OFF';
      });
    }

    Future<void> showFilterDialogBox() async {
      return showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text(
                  'Apply filter on meals',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SwitchListTile(
                        title: Text("title"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.symmetric(),
                        value: isSwitched,
                        onChanged: (bool value) {
                          setState(() {
                            isSwitched = !value;
                          });
                        })
                    // CupertinoSwitch(
                    //     value: _switchValue,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         _switchValue = !value;
                    //         print("switch value : $_switchValue");
                    //       });
                    //     }),
                  ],
                ),
              )));
    }

// Tab Setting

    void _toggleFavouriteMealStatus(Meal meal) {
      final isExisting = _favouriteMeals.contains(meal);

      if (isExisting) {
        setState(() {
          _favouriteMeals.remove(meal);
        });
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Removed your favourites')));
        print(_favouriteMeals);
      } else {
        setState(() {
          _favouriteMeals.add(meal);
        });
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to your favourites')));
        print(_favouriteMeals);
      }
    }

    Widget activePage = MainCategories(
      onToggleFavourite: _toggleFavouriteMealStatus,
    );
    var activePageTitle = 'Pick your category';

    if (_selectedPageIndex == 1) {
      activePage = MealsofCategory(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleFavouriteMealStatus,
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
        endDrawer: Drawer(
          surfaceTintColor: const Color.fromARGB(255, 163, 23, 13),
          // transparent color background
          //backgroundColor: Colors.deepOrangeAccent.withOpacity(0.5),
          backgroundColor: const Color.fromARGB(255, 245, 147, 1),
          elevation: 2.0,
          width: 230,
          clipBehavior: Clip.antiAlias,
          shape: const BeveledRectangleBorder(
              side: BorderSide(
                  //width: 50,
                  style: BorderStyle.solid,
                  color: Color.fromARGB(255, 245, 147, 1),
                  strokeAlign: BorderSide.strokeAlignOutside),
              borderRadius: BorderRadius.horizontal(
                left: Radius.elliptical(160, 200),
              )),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top: 90, bottom: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.fastfood_outlined,
                    size: 50,
                  ),
                  title: Text(
                    'Cook with me',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              const Divider(
                color: Colors.orangeAccent,
              ),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text(
                    'Favourite Meals',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showFilterDialogBox();
                },
                child: const ListTile(
                  leading: Icon(Icons.filter),
                  title: Text(
                    'Apply Filters',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
