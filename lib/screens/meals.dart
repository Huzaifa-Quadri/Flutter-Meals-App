import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widjets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Text("Uh Oh...",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer)),

            const SizedBox(height: 16),

            Text("Try Selecting a different Category",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).highlightColor))
          ]),
    );
     
  if (meals.isNotEmpty) {
    bodyContent = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
    );
  }
  if(title == null){
    return bodyContent;
  }
  
  return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: bodyContent
    );
  }
}
