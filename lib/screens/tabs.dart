import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;
  final List<Meal> _favouritemeals = [];

  void _maintainfavourites(Meal meal){
    if(_favouritemeals.contains(meal)){
      _favouritemeals.remove(meal);
    }else{
      _favouritemeals.add(meal);
    }
  }
  void _selectPage(int index){
    setState(() {
      _selectedPage = index; 
    });
  }
  
  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavourite: _maintainfavourites,); 
    var activepageTitle = 'Categories';

    if (_selectedPage == 1) {
      activepageTitle = 'Favourites';
      activePage = Meals( meals: const [], onToggleFavourite: _maintainfavourites);   //TODO: Done!!!!    Comming from _iconOntap() -> Meal_detail ->  Meal_Item -> Meals -> Tabs --> _maintainfavourites()
       
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle),
      ),
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
