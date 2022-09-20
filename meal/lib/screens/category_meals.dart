import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static String routeName = "/category-meal";
  Map<String, bool> filters;
  CategoryMeals({required this.filters});
  @override
  Widget build(BuildContext context) {
    final Map arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final meals = DUMMY_MEALS.where((meal) {
      if ((filters['gluten'] as bool) && !meal.isGlutenFree) {
        return false;
      } else if ((filters['lactose'] as bool) && !meal.isLactoseFree) {
        return false;
      } else if ((filters['vegan'] as bool) && !meal.isVegan) {
        return false;
      } else if ((filters['vegetarian'] as bool) && !meal.isVegetarian) {
        return false;
      }

      return meal.categories.contains(arguments["id"]);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["title"]),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          Meal meal = meals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            affordability: meal.affordability,
            duration: meal.duration,
            complexity: meal.complexity,
            imageUrl: meal.imageUrl,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
