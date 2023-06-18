import 'package:meal_app/datas/dummy_datas.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';

class Home extends StatefulWidget {
  final List<Meal> availableMeals;

  const Home({super.key, required this.availableMeals});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Use Navigator.push to push a new route on the top of current [context]
  void _selectCategory(BuildContext context, Category category) {
    // The filtered list that only contain the foods match the category
    final mealList = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: mealList,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      //-----------------------Category GridView------------------------------
      body: AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing: 10,
            mainAxisExtent: 210,
          ),
          children: items
              .map(
                (category) => CategoryItem(
                  category: category,
                  onSelectCategory: () => _selectCategory(context, category),
                ),
              )
              .toList(),
        ),
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
