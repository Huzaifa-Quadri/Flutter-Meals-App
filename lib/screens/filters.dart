import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
  
}

class _FilterScreen extends State<Filters> {

  var _isglutenfilterset = false;
  var _isVeganfilterset= false;
  var _isVegetarianfilterset= false;
  var _isLactoseFreefilterset= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Title"),
      ),
      body: Column(
        children: [
          SwitchListTile(value: _isglutenfilterset,
          onChanged: (ischecked){
            setState(() {
              _isglutenfilterset = ischecked;     //*isChecked is boolean value changed by toggling the switch to on or off 
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
          title: Text("Vegan-free", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
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
    );
  }
}