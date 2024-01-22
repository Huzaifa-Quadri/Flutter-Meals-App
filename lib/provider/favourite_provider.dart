import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

/*//!   when using StateNotifier, you're not allowed to edit an existing value in memory, instead you must always create a new one.
  //!   That's simply a pattern enforced by this Provider package. 
*/

class FavMealsNotifier extends StateNotifier<List<Meal>>{  // Convention to add Notifier at end of class name
                                                  //Todo : State Notifier is generic class so we have to specify which kind of data will be managed by Notifier and ult by provider
  FavMealsNotifier() :  super([]);                //? A. Initial Value -> Empty list of meals; Passing to super here equal to type of speacified in angular brackets
  bool toggleMealFavouriteStatus(Meal meal){      //? B. Method to edit data
    final mealIsFav = state.contains(meal);

    if(mealIsFav){
      state = state.where((ml) => ml.id != meal.id).toList();
      return false;
    }
    else
    {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritMealsProvider = StateNotifierProvider<FavMealsNotifier, List<Meal>>(((ref) { 
  return FavMealsNotifier();                                     //* And now this provider returns an instance of our notifier class so that we have this class for editing the state and for retrieving the state.
}));