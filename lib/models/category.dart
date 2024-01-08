import 'package:flutter/material.dart';

class Category {
  const Category({required this.id, required this.title, this.color = Colors.orange });   // Setting an default color if no color is choosen

  final String id;
  final String title;
  final Color color; 
}
