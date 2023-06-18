import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen/ingredient.dart';
import 'package:meal_app/screens/meal_detail_screen/instruction.dart';
import 'package:meal_app/widgets/meal_symbol.dart';

class MealDetail extends StatelessWidget {
  final Meal meal;

  const MealDetail({super.key, required this.meal});

  /// Formatter for price enum
  String get priceFormat {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  /// Formatter for complexity enum
  String get complexityFormat {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  @override
  Widget build(context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          children: [
            // 1. The divider between the title and the detail section
            Divider(
              color: Colors.grey.shade400,
              height: 1,
            ),

            // Space between 1) and 2)
            const SizedBox(
              height: 20,
            ),

            // 2. The section for food price and complexity with icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Row(
                children: [
                  // First symbol: Affordability
                  MealSymbol(
                    icon: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey.shade300,
                      child: const Icon(
                        FontAwesomeIcons.creditCard,
                      ),
                    ),
                    label: Text(
                      priceFormat,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Second symbol: Difficulty
                  MealSymbol(
                    icon: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey.shade300,
                      child: const Icon(
                        FontAwesomeIcons.dumbbell,
                      ),
                    ),
                    label: Text(
                      complexityFormat,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.grey.shade400,
              height: 30,
            ),

            // 3. The section for ingredients
            Ingredient(ingredients: meal.ingredients),

            Divider(
              color: Colors.grey.shade400,
              height: 30,
            ),

            // 4. The steps of the meal
            Instruction(steps: meal.steps),
          ],
        ),
      ),
    );
  }
}
