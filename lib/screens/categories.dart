
import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widjets/category_griditem.dart';

class CategoriesScreen extends StatefulWidget {                                    //! Converted to stateful widget for adding animation as it changes states
  const CategoriesScreen({super.key, required this.onToggleFavourite, required this.commingfilteredMeals});

  final void Function (Meal meal) onToggleFavourite;  //Not Understood 
  final List<Meal> commingfilteredMeals;    
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin { 
//TODO:  SingleTickerProviderStateMixin which is provided by Flutter, And behind the scenes, this class which we're merging into our class here, simply provides various features that are needed by Flutter's animation system.
  
  late AnimationController _animationHandler;
  @override
  void initState() {
    super.initState();
    _animationHandler = AnimationController(
      vsync: this,              //* Vsync need a Ticker ; Vsync make sure this animation executes for every frame so 60 fps
      duration: const Duration(milliseconds: 300),
      lowerBound: 0, //<-- by default
      upperBound: 1,
    );
    _animationHandler.forward();
  }

  @override
  void dispose() {
    _animationHandler.dispose(); //animtionhandler is removed from memory once widget is removed; ie, to not cause memory overflow issues
    super.dispose();
  }

    //contain filetered meals 
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.commingfilteredMeals.where((meal) => meal.categories.contains(category.id))
        .toList(); // dummymeals changes to commingavailable meals bcz now only filtered meals are divided and shown according to categories

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title, 
          meals: filteredMeals,
          onToggleFavourite: widget.onToggleFavourite,
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
    return AnimatedBuilder(
      animation: _animationHandler,
      builder: (context, child) => Padding(padding: EdgeInsets.only(
        top: 100 -_animationHandler.value * 100
      ),
      child: child,
      ),
      child: GridView(
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
        ),
      // ),
    );
  }
}


//! THIS IS ANIMATION BRANCH 