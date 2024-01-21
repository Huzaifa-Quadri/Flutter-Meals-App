import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider_pack.dart';
// import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widjets/appdrawer.dart';

// todo:                                                    THIS IS THE ACTUAL HOME PAGE OR SCREEN OF THE ENTIRE APP

const kInitialFilters = {
  Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegetarian : false,
  Filter.vegan : false,
};

class TabsScreen extends ConsumerStatefulWidget {         //Statefull -> ConsumerStatefulWidget
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() { //State -> ConsumerState
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {   
  int _selectedPage = 0;
  final List<Meal> _favouritemeals = [];

  // ignore: unused_field
  Map<Filter, bool> _selectedfilters = kInitialFilters;  //assigning kinitialfilter to _selectedfilters

  void _maintainfavourites(Meal meal){
    if(_favouritemeals.contains(meal)){
      setState(() {
        _favouritemeals.remove(meal);
        _showfavTogglemessage("Meal removed from favourites !!");
      });
      
    }else{
      setState(() {
        _favouritemeals.add(meal);
        _showfavTogglemessage("Meal added to favourites");
      });  
    }
  }
  void _selectPage(int index){
    setState(() {
      _selectedPage = index; 
    });
  }

  void _showfavTogglemessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _setScreen(String identifier)async{                // For filter option in app drawer item onClick
    Navigator.pop(context); //App drawer only opens on category screen so it is right to close it if anyone click Meals
    if(identifier == 'filters'){
      final result = await Navigator.push<Map<Filter, bool>>
      (
        context,
        MaterialPageRoute(builder: (ctx) => Filters(currentorsavedfilters: _selectedfilters)),
      );
      print(result);

      setState(() {
        _selectedfilters = result ?? kInitialFilters;
      });

    }
  }
  
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);       //* * Using ref method as a listener here for provider in provider_pack.dart file 
                                                  //? Using Provider instead of importing dummy data for understanding concepts
    final availablemeals = meals.where((meal) {
      if(_selectedfilters[Filter.glutenFree]! && !meal.isGlutenFree){  //* _selectedfilters[Filter.glutenFree]! is true if it is toggeled in filter option and 
        return false;                                                  //* !meal.isGlutenFree is true if an indivisual meal is not gluten free so T && T = T where we return false to not select meal
      }
      if(_selectedfilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedfilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedfilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _maintainfavourites,
      commingfilteredMeals: availablemeals,
    ); 
    var activepageTitle = 'Categories';

    if (_selectedPage == 1) {
      activepageTitle = 'Favourites';
      activePage = Meals( meals: _favouritemeals, onToggleFavourite: _maintainfavourites);   //TODO: Done!!!!  Comming from _iconOntap() -> Meal_detail ->  Meal_Item -> Meals -> Tabs --> _maintainfavourites()
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle),
      ),
      drawer: AppDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
