import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
// import 'package:meals/screens/meals.dart';

class CategoryItem extends StatelessWidget{
  const CategoryItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).secondaryHeaderColor ,  //Best 
      onTap: onSelectCategory,       //! ///////////////////////////// On Tap
      child: Container(     
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.8),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ) 
        ),
    
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          )
        ),
      ),
    );
  }
  
}