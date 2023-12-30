import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 17,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        )
      ],
    );
  }
}
