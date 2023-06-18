import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/provider/favourites_provider.dart';
import 'package:meal_app/widgets/meal_symbol.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealAppBar extends ConsumerWidget {
  final Meal meal;

  const MealAppBar({
    super.key,
    required this.meal,
  });

  @override
  Widget build(context, ref) {
    // This will rebuild the widget when the favourites list change
    final favouriteMeals = ref.watch(favouritesProvider);

    // Check if the meal is favourited
    bool inFavourite = favouriteMeals.contains(meal);

    ///
    void displayMessage(bool isFavourite) {
      // Make sure to clear any exist snackbar
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          duration: const Duration(seconds: 3),
          content: Text(
            isFavourite
                ? 'Added to Favourite List'
                : 'Removed from Favourite List',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          backgroundColor: isFavourite ? Colors.green : Colors.red,
        ),
      );
    }

    //----------------------------------------RENDERING START FROM HERE-------------------------------------------

    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: meal.id,
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),

      // 2. The leading back button on the app bar
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        ),
      ),

      // 3. The bookmark button
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: () {
                  bool isFavourite = ref
                      .read(favouritesProvider.notifier)
                      .toggleMealFavouriteStatus(meal);
                  displayMessage(isFavourite);
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(seconds: 2),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: inFavourite
                      ? const FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
                        )
                      : const Icon(FontAwesomeIcons.heart),
                )),
          ),
        ),
      ],

      // 4. The heading of the detail section: always visible
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),

          // Make it the color of white
          color: Theme.of(context).colorScheme.background,

          // Extend the width to maximum
          width: double.infinity,

          child: Row(
            children: [
              Expanded(
                child: Text(
                  meal.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              MealSymbol(
                icon: const Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.black54,
                  size: 20,
                ),
                label: Text(
                  '${meal.duration} min',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
