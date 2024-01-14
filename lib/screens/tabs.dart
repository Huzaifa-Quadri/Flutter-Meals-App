import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widjets/appdrawer.dart';

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

  void _setScreen(String identifier){                // For filter option in app drawer item onClick
    Navigator.pop(context);
    if(identifier == 'filters'){
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Filters()));
    }
    else{
      
    }
  }
  
  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavourite: _maintainfavourites,); 
    var activepageTitle = 'Categories';

    if (_selectedPage == 1) {
      activepageTitle = 'Favourites';
      activePage = Meals( meals: _favouritemeals, onToggleFavourite: _maintainfavourites);   //TODO: Done!!!!    Comming from _iconOntap() -> Meal_detail ->  Meal_Item -> Meals -> Tabs --> _maintainfavourites()
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
