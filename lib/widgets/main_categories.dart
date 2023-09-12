import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_container.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CategoryContainer(
                  onTap: () {},
                  leftMargin: 0,
                  rightMargin: 55,
                  assetImage: 'assets/images/italian.jpg',
                  title: 'Italian'),
              CategoryContainer(
                  onTap: () {},
                  leftMargin: 65,
                  rightMargin: 0,
                  assetImage: 'assets/images/quickandeasy.jpg',
                  title: 'Quick & Easy'),
              CategoryContainer(
                  onTap: () {},
                  leftMargin: 0,
                  rightMargin: 55,
                  assetImage: 'assets/images/hamburgers.jpg',
                  title: 'Hamburgers'),
              CategoryContainer(
                  onTap: () {},
                  leftMargin: 65,
                  rightMargin: 0,
                  assetImage: 'assets/images/german.jpg',
                  title: 'German'),
            ],
          ),
        ),
        endDrawer: const Drawer(
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
                padding: EdgeInsets.only(left: 30.0, top: 90),
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
