import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = "/CategoriesScreen";
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
                id: catData.id,
                color: catData.color,
                title: catData.title,
              ))
          .toList(),
    );
  }
}
