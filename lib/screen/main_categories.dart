import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_container.dart';

class MainCategories extends StatefulWidget {
  const MainCategories({super.key});

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
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
