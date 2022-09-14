import 'package:flutter/material.dart';
import './category_item.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Bar")),
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  color: catData.color,
                  title: catData.title,
                ))
            .toList(),
      ),
    );
  }
}
