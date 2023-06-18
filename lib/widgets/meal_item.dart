import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_symbol.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function() onSelectedMeal;

  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });

  /// Make the complexity uppercase
  String get complexityFormat {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  @override
  Widget build(context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20),
      clipBehavior: Clip
          .hardEdge, //Remove the area where the widget go out of the boundary of card
      child: InkWell(
        onTap: onSelectedMeal,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl,
                ),
                fit: BoxFit.fill,
                width: double.infinity,
                height: 225,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                color: const Color.fromARGB(74, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. The title of the meal
                    Text(
                      meal.title,
                      maxLines: 2, //Max line of texts allowed
                      overflow: TextOverflow.ellipsis, // ex: abc...
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // 2. The attributes of the meal
                    Row(
                      children: [
                        MealSymbol(
                          icon: const Icon(
                            FontAwesomeIcons.clock,
                            color: Colors.white,
                          ),
                          label: Text(
                            '${meal.duration} min',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Spacer(),
                        MealSymbol(
                          icon: const Icon(
                            FontAwesomeIcons.dumbbell,
                            color: Colors.white,
                          ),
                          label: Text(
                            complexityFormat,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
