import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widjets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals, required this.onToggleFavourite});

  final String? title;
  final List<Meal> meals;

  final void Function (Meal meal) onToggleFavourite;

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
            Text("Nothing Here",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).hintColor)),

            Text("Try Selecting a different Category",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).highlightColor),
                  textAlign: TextAlign.center,
                )
          ]),
    );
     
  if (meals.isNotEmpty) {
    bodyContent = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(meal: meals[index], onToggleFavourite: onToggleFavourite,),
    );
  }
  if(title == null){                
    return bodyContent;
  }   
                    
  //TODO : we can also eleminate double title other than conditionally by letting indivisual screen themselves set their own appbars intead of one appbar in Tabs Screen forward to indivisual displayed screens.  Code for that is :
  //* <Just Remove above if & Make following changes in Tabs Screen > -
   /*
*     return Scaffold(
*       body: activePage,
*       bottomNavigationBar: BottomNavigationBar(...),
  );
    */
  return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: bodyContent
    );
  }
}
