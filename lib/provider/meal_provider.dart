import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/datas/dummy_datas.dart';

final mealProvider = Provider(
  (ref) => dummyMeals,
);
