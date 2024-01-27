import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widjets/mealitem_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onToggleFavourite});

  final void Function (Meal meal) onToggleFavourite;

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void onSelectMeal(BuildContext context,meal){
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => MealDetails(meal: meal, onToggleFavourite: onToggleFavourite)
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    // final get 

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: (){
          // MealDetails(meal: meal);          Not like this
          onSelectMeal(context, meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(placeholder: MemoryImage(kTransparentImage), 
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              // top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: const Color.fromARGB(218, 0, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(
                  children: [
                    Text(meal.title, 
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,      //* Very long text....
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),

                    const SizedBox(height: 12,),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration}min'),
                        const SizedBox(width: 12,),                      
                        MealItemTrait(icon: Icons.attach_money, label: complexityText),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.work, label: affordabilityText)
                    ],)
                  ],
                )
                
              )
            )
          ]
        ),
      ),
    );
  }
  
}