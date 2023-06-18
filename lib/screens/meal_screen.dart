import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen/meal_detail_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  final bool wantAppBar;

  const MealScreen({
    super.key,
    required this.title,
    required this.meals,
    this.wantAppBar = true,
  });

  /// Add a [meal] detail page route on the top of current [context]
  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectedMeal: () => _selectMeal(context, meals[index]),
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The empty list image
            Image.asset(
              'assets/empty_list.png',
              cacheWidth: 300,
            ),
            const SizedBox(
              height: 10,
            ),

            // Using text.rich widget to apply different style for
            // different text
            const Text.rich(
              TextSpan(
                text: 'The Page is ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: 'Empty',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'You have nothing here...',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      //-----------------------APP BAR------------------------------
      appBar: wantAppBar ? AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ) : null,

      body: content,
    );
  }
}
