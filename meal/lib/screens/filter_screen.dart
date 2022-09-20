import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filter-screen";

  Function saveFilters;
  Map<String, bool> filters;

  FilterScreen({required this.filters, required this.saveFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool isValueSet = false;

  Widget buildListViewSwitchTile(
      String title, String subTitle, bool value, Function updateValue) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: (newValue) {
        updateValue(newValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Filterssss ${widget.filters}');

    if (!isValueSet) {
      isValueSet = true;
      _glutenFree = widget.filters['gluten'] as bool;
      _vegetarian = widget.filters['vegetarian'] as bool;
      _vegan = widget.filters['vegan'] as bool;
      _lactoseFree = widget.filters['lactose'] as bool;
    }

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                widget.filters['gluten'] = _glutenFree;
                widget.filters['vegetarian'] = _vegetarian;
                widget.filters['vegan'] = _vegan;
                widget.filters['lactose'] = _lactoseFree;
                widget.saveFilters(widget.filters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Adjust your Meal Selection ..!",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: Container(
          child: ListView(
            children: [
              buildListViewSwitchTile(
                  "Gluten free",
                  "Enable to checkout gluten free meals",
                  _glutenFree, (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildListViewSwitchTile(
                  "Vegetarian",
                  "Enable to checkout Vegetarian meals",
                  _vegetarian, (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              buildListViewSwitchTile(
                "Vegan",
                "Enable to checkout Vagen meals",
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
              buildListViewSwitchTile(
                  "Lactose free",
                  "Enable to checkout lactose free meals",
                  _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              })
            ],
          ),
        ))
      ]),
    );
  }
}
