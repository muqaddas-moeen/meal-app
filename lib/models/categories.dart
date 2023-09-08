import 'package:flutter/material.dart';

class Categories {
  Categories(
      {required this.id,
      required this.title,
      this.color = const Color.fromARGB(255, 143, 88, 88)});

  final String id;
  final String title;
  final Color color;
}
