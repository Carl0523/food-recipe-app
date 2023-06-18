import 'package:flutter/material.dart';

class MealSymbol extends StatelessWidget {
  final Widget icon;
  final Text label;

  const MealSymbol({super.key, required this.icon, required this.label});

  @override
  Widget build(context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        label,
      ],
    );
  }
}
