import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen/meal_appbar.dart';
import 'package:meal_app/screens/meal_detail_screen/meal_detail.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailScreen(
      {super.key, required this.meal});

  @override
  Widget build(context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. The app bar section: meal image and back button
          MealAppBar(
            meal: meal,
          ),

          // 2. The detail information
          MealDetail(meal: meal),
        ],
      ),
    );
  }
}
