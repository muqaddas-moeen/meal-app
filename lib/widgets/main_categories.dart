import 'package:flutter/material.dart';
import 'package:meal_app/theme/color.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 55, top: 20),
                  width: 250,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/italian.jpg'),
                        opacity: 1.7,
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Italian',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 65, right: 0, top: 20),
                  width: 250,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/quickandeasy.jpg'),
                        opacity: 1.7,
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Quick & Easy',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 55, top: 20),
                  width: 250,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hamburgers.jpg'),
                        opacity: 1.7,
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Hamburgers',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 65, right: 0, top: 20),
                  width: 250,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/german.jpg'),
                        opacity: 1.7,
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'German',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        endDrawer: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: const Drawer(
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
                    color: Colors.white,
                    strokeAlign: BorderSide.strokeAlignOutside),
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(220))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70.0, top: 70),
                  child: ListTile(
                    title: Text(
                      'Cook with me',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    subtitle: Icon(
                      Icons.fastfood_outlined,
                      size: 50,
                    ),
                  ),
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
          ),
        ));
  }
}
