import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideDrawer extends StatelessWidget {

  final void Function(String identifier) onSelectScreen;

  const SideDrawer({super.key, required this.onSelectScreen});

 

  @override
  Widget build(context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: Column(
        children: [
          // 1. The heading page of the drawer
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: double.infinity,
            height: 230,
            color: Theme.of(context).primaryColor,
            child: const Column(
              children: [
                // a. The profile image
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(
                    'assets/katyhuang.jpeg',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Katy Huang',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'katyh1@uci.edu',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

          // 2. The ListTile items

          // a. the Meal page
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            leading: const Icon(FontAwesomeIcons.utensils),
            title: const Text(
              'Meal',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),

          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            leading: const Icon(FontAwesomeIcons.gear),
            title: const Text(
              'Filter',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
