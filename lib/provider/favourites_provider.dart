import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/models/meal.dart';

class FavouriteMealsNotifer extends StateNotifier<List<Meal>> {
  // Initialize the constructor with an empty list
  FavouriteMealsNotifer() : super([]);

  // Adding functions down here 👇🏻

  /// Check if the [meal] is already in the favourite list
  /// if so, remove (unfavourite) it, otherwise, add (favourite) it
  bool toggleMealFavouriteStatus(Meal meal) {
    // A bool to check if the current meal is favourited (In the favourite list)
    final existMeal = state.contains(meal);

    // If so, try to remove it by using where function
    if (existMeal) {
      // Remove only the one with same id
      state = state.where((currMeal) => currMeal.id != meal.id).toList();
      return false;
    }
    // Otherwise add it into the favourite list
    else {
      // The spread operator [...] pull out the list as individual elements into
      // the new list, and adding the new element after.
      state = [...state, meal];
      return true;
    }
  }

 
}

final favouritesProvider =
    StateNotifierProvider<FavouriteMealsNotifer, List<Meal>>(
  (ref) => FavouriteMealsNotifer(),
);
