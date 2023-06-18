import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meal_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  // Initialize the constructor with setting filters state to false
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive, // This will override the original key
    };
  }

  void setFilters(Map<Filter, bool> newFilters) {
    state = newFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final mealFilterProvider = Provider(
  (ref) {
    final meals = ref.watch(mealProvider);
    final filtersState = ref.watch(filtersProvider);

    return meals.where(
      (meal) {
        if (filtersState[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (filtersState[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (filtersState[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (filtersState[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
  },
);
