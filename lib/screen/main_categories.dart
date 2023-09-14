import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/widgets/category_container.dart';

class MainCategories extends StatefulWidget {
  const MainCategories({super.key});

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pick your category',
              style: GoogleFonts.pacifico(
                  color: const Color.fromARGB(255, 163, 23, 13))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              //  availableCategories.map((category) =>
              //  CategoryContainer(category: category)).toList(),

              for (final category in availableCategories)
                CategoryContainer(category: category),

              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
        endDrawer: const Drawer(
          surfaceTintColor: Color.fromARGB(255, 163, 23, 13),
          // transparent color background
          //backgroundColor: Colors.deepOrangeAccent.withOpacity(0.5),
          backgroundColor: Color.fromARGB(255, 245, 147, 1),
          elevation: 2.0,
          width: 230,
          clipBehavior: Clip.antiAlias,
          shape: BeveledRectangleBorder(
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
              Padding(
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
              Divider(
                color: Colors.orangeAccent,
              ),
              SizedBox(
                height: 70,
              ),
              ListTile(
                leading: Icon(Icons.food_bank),
                title: Text(
                  'Meal',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                leading: Icon(Icons.filter),
                title: Text(
                  'Filter',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}
