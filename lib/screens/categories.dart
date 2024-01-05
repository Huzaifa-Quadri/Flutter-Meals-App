// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/screens/meals.dart';
// import 'package:meals/widjets/category_griditem.dart';

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});

//   void _selectedCategory(BuildContext context, Category category){

//     final filteredMeals = dummyMeals.where(
//       (meal) => meal.categories.contains(category.id)
//       ).toList();

//     Navigator.push(context, MaterialPageRoute(       //* Alt : Navigator.of(context).push(route)
//       builder: (ctx) => Meals(
//         title: category.title,
//         meals: filteredMeals,
//       )
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Meals"),
//       ),
//       body: GridView(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 3 / 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 10
//           ),

//         children:  [
//           for(final category in availableCategories)
//             CategoryItem(category: category, onSelectCategory: (){
//               _selectedCategory(context, category);
//             })
//           // Text("1", style: TextStyle(color: Colors.amberAccent),),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widjets/category_griditem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title, 
          meals: filteredMeals
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
