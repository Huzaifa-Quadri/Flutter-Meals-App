import 'package:flutter/material.dart';
import 'package:meals/widjets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.onSelectScreen});
  
  final void Function (String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: 
            [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withBlue(100),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),
          ), 
          child: Row(
            children: [
              const Icon(Icons.fastfood_rounded),
              const SizedBox(width: 18,),
              Text("Cooking Up", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
                ),
              ),
            ],
          )
        ),
        
        DrawerItem(icon: Icons.fastfood_outlined, title: "Meals", onSelectScreen: onSelectScreen),
        DrawerItem(icon: Icons.settings, title: "Settings", onSelectScreen: onSelectScreen),       
        DrawerItem(icon: Icons.filter_alt_sharp, title: "Fliters", onSelectScreen: onSelectScreen,)
      ],
    );

  }
  
}