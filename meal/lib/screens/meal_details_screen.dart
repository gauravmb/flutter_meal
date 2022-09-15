import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static String routeName = '/meal-details';

  Widget buildTitleContainer(String title, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildListContainer(Widget child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == arguments['id']);
    return Scaffold(
        appBar: AppBar(title: Text(selectedMeal.title)),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleContainer("Ingredients", context),
            buildListContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
              context,
            ),
            buildTitleContainer("Steps", context),
            buildListContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Text((index + 1).toString()),
                      ),
                      title: Column(
                        children: [
                          Container(
                            child: Text(
                              selectedMeal.steps[index],
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
                context),
            SizedBox(
              height: 10,
            )
          ]),
        ));
  }
}
