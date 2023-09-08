import 'package:flutter/material.dart';
import 'package:meal_app/theme/color.dart';

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
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5.0),
                color: Colors.amber,
              ),
              child: const Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5.0),
                color: Colors.black,
              ),
              child: const Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5.0),
                color: Colors.green,
              ),
              child: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5.0),
                color: Colors.indigo,
              ),
              child: const Text(
                '4',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
    );
  }
}
