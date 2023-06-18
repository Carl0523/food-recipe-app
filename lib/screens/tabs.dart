import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_app/provider/favourites_provider.dart';
import 'package:meal_app/screens/home.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/widgets/side_drawer.dart';
import 'package:meal_app/provider/filters_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currPageIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currPageIndex = index;
    });
  }

  bool existMeal = false;

  void _setScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    }
  }

  ///-----------------------------Build start here-------------------------------
  @override
  Widget build(context) {


    // Filter out the meals
    final availableMeals = ref.watch(mealFilterProvider);

    Widget currScreen = Home(
      availableMeals: availableMeals,
    );

    if (_currPageIndex == 1) {
      final favouriteList = ref.watch(favouritesProvider);
      currScreen = MealScreen(
        title: 'Favourite',
        meals: favouriteList,
        wantAppBar: false,
      );
    }

    return Scaffold(
      appBar: _currPageIndex == 0
          ? AppBar(
              leadingWidth: 30,
              // Combination of logo and software name
              title: Row(
                children: [
                  // 1. Logo
                  Image.asset(
                    'assets/logo.png',
                    cacheWidth: 28,
                  ),

                  // Space between 1)Logo and 2)Software Name
                  const SizedBox(
                    width: 10,
                  ),

                  // 2. Software name
                  Text(
                    'Meal Explorer',
                    style: GoogleFonts.lobster(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            )
          : AppBar(
              title: const Text(
                'Favourite',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

      // The side bar drawer
      drawer: SideDrawer(
        onSelectScreen: _setScreen,
      ),

      body: currScreen,

      // The bottom navigar bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        backgroundColor: Colors.grey.shade300,
        showUnselectedLabels: false,
        onTap: _changePage,
        currentIndex: _currPageIndex,
        selectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookmark),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
