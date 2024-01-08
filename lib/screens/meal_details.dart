import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal, required this.onToggleFavourite,});

  final Meal meal;
  final void Function (Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () {
            onToggleFavourite(meal);
          },
          icon: const Icon(Icons.star))
        ],
      ),
      body: Scrollbar(           //* Adding scrollbar on my own
        trackVisibility: true,
        thickness: 10,
        radius: const Radius.circular(20),
        interactive: true,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 280,
                width: double.infinity,
              ),
      
              const SizedBox(height: 15,),
      
              Text("Ingeredients",                     //Ingredient Heading
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer)
              ),
      
              for (final ingredient in meal.ingredients)      //Ingr text
                  Text(ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                      ),
                  ),
                
                const SizedBox(height: 24),
              
              Text(                             //Steps Heading
                 "Steps to Make",
                 style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
      
              for(final step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8
                    ),
                    child: Text(
                      step,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                        .textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground)
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}






// Text(                           //Ingredient Text
//               meal.ingredients.toString(),
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: Theme.of(context).colorScheme.onBackground),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             
//             Text(                             // Steps Text
//               meal.steps.toString(),
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: Theme.of(context).colorScheme.onBackground),
//             ),