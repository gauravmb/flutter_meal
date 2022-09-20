import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          child: Text(
            "Cooking Up !!!",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 20,
          ),
          title: const Text(
            "Meals",
            style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 20,
          ),
          title: const Text(
            "Settings",
            style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          },
        )
      ]),
    );
  }
}
