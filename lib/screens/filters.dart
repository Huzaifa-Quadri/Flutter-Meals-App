import 'package:flutter/material.dart';


enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}
class Filters extends StatefulWidget {
  const Filters({super.key, required this.currentorsavedfilters});

  final Map<Filter, bool> currentorsavedfilters;                       //* Method or way to reset back all filters to default when we hit the filterScreen again !

  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<Filters> {

  var _isglutenFreefilterset = false;
  var _isVeganfilterset= false;
  var _isVegetarianfilterset= false;
  var _isLactoseFreefilterset= false;

  @override
  void initState() {                                                                  
    super.initState();
    _isglutenFreefilterset = widget.currentorsavedfilters[Filter.glutenFree]!;
    _isVeganfilterset = widget.currentorsavedfilters[Filter.vegan]!;
    _isVegetarianfilterset = widget.currentorsavedfilters[Filter.vegetarian]!;
    _isLactoseFreefilterset = widget.currentorsavedfilters[Filter.lactoseFree]!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Title"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          Navigator.pop(context, {
            Filter.glutenFree: _isglutenFreefilterset,
            Filter.lactoseFree: _isLactoseFreefilterset, 
            Filter.vegetarian: _isVegetarianfilterset,
            Filter.vegan: _isVeganfilterset,
          });
        },
    // WillPopScope(           //! Deprecated version & now PopScope is used !
    //   onWillPop: () async {
    //     Navigator.pop(context, {
    //       Filter.glutenFree: _isglutenFreefilterset,
    //       Filter.lactoseFree: _isLactoseFreefilterset,
    //       Filter.vegetarian: _isVegetarianfilterset,
    //       Filter.vegan: _isVeganfilterset,
    //     });
    //   return false;
    // },
      child: Column(
          children: [
            SwitchListTile(value: _isglutenFreefilterset,
            onChanged: (ischecked){
              setState(() {
                _isglutenFreefilterset = ischecked;     //*isChecked is boolean value changed by toggling the switch to on or off 
              });
            },
            title: Text("Gluten-free", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only include gluten-free Meals", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
      
      
            SwitchListTile(value: _isVeganfilterset,
            onChanged: (ischecked){
              setState(() {
                _isVeganfilterset = ischecked;     //*isChecked is boolean value changed by toggling the switch to on or off 
              });
            },
            title: Text("Vegan", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only include vegan Meals", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
      
      
            SwitchListTile(value: _isVegetarianfilterset,
            onChanged: (ischecked){
              setState(() {
                _isVegetarianfilterset = ischecked;     //*isChecked is boolean value changed by toggling the switch to on or off 
              });
            },
            title: Text("Vegetarian", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only include Vegetarian Meals", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
      
      
            SwitchListTile(value: _isLactoseFreefilterset,
            onChanged: (ischecked){
              setState(() {
                _isLactoseFreefilterset = ischecked;     //*isChecked is boolean value changed by toggling the switch to on or off 
              });
            },
            title: Text("Lactose-free", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only include lactose-free Meals", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
          ],
        ),
      ),
    );
  }
}