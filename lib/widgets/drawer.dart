import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegatarianFree, veganFree }

var kGlutenFree = false;
var kLactoseFree = false;
var kVeganFree = false;
var kVegatarianFree = false;

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key, required this.onSelectScreen});

  void Function(String identifier) onSelectScreen;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<void> showFilterDialogBox() {
    print(Filter.values);
    return showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              backgroundColor: Color.fromARGB(255, 100, 29, 24),
              title: const Text(
                'Apply filter on meals',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                      title: Text(
                        "Gluten-Free",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Include only gluten free',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                      activeColor: Colors.white,
                      //controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(),
                      value: kGlutenFree,
                      onChanged: (isSwitched) {
                        setState(() {
                          kGlutenFree = isSwitched;
                        });
                      }),
                  SwitchListTile(
                      title: Text(
                        "Lactose-Free",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Include only lactose free',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                      activeColor: Colors.white,
                      //controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(),
                      value: kLactoseFree,
                      onChanged: (isSwitched) {
                        setState(() {
                          kLactoseFree = isSwitched;
                        });
                      }),
                  SwitchListTile(
                      title: Text(
                        "Vegatarian",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Include only vegatarian',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                      activeColor: Colors.white,
                      //controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(),
                      value: kVegatarianFree,
                      onChanged: (isSwitched) {
                        setState(() {
                          kVegatarianFree = isSwitched;
                        });
                      }),
                  SwitchListTile(
                      title: Text(
                        "Vegan",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Include only vegan',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                      activeColor: Colors.white,
                      //controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(),
                      value: kVeganFree,
                      onChanged: (isSwitched) {
                        setState(() {
                          kVeganFree = isSwitched;
                        });
                      }),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () {
              widget.onSelectScreen('meals');
            },
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
              widget.onSelectScreen('filters');
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
    );
  }
}
