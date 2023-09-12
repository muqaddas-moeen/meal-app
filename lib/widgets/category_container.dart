import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  CategoryContainer(
      {super.key,
      required this.onTap,
      required this.leftMargin,
      required this.rightMargin,
      required this.assetImage,
      required this.title});

  void Function() onTap;
  double leftMargin;
  double rightMargin;
  String assetImage;
  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin, top: 20),
        width: 250,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetImage),
              opacity: 1.7,
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
