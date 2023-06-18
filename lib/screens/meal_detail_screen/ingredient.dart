import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  final List<String> ingredients;

  const Ingredient({super.key, required this.ingredients});

  @override
  Widget build(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          // 1. The title of [Ingreident] text
          const Text(
            'Ingredient',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
    
          // The space between 1) and 2)
          const SizedBox(
            height: 10,
          ),
    
          // 2. the ingredient list
          for (final ingredient in ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '- $ingredient',
                style: const TextStyle(fontSize: 18),
              ),
            )
        ],
      ),
    );
  }
}
