import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widjets/category_griditem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.commingfilteredMeals});

  
  final List<Meal> commingfilteredMeals;    //contain filetered meals 

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = commingfilteredMeals.where((meal) => meal.categories.contains(category.id))
        .toList(); // dummymeals changes to commingavailable meals bcz now only filtered meals are divided and shown according to categories

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title, 
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  
  Widget build(BuildContext context) {
    // return Scaffold(           //?? Removing Scaffold here because of 2 title bar 
    //   appBar: AppBar(
    //     title: const Text('Pick your category'),
    //   ),
    //   body: 
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)     //* availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            CategoryItem(
              category: category, 
              onSelectCategory: () {    // TODO: function that gets ontap value here
                _selectCategory(context, category);
              },
            )
        ],
      );
    // );
  }
}
