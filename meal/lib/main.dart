import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/category_meals.dart';
import 'package:meal/screens/meal_details_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen()
      },
    );
  }
}
