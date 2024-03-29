import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.icon, required this.title, required this.onSelectScreen});
  
  final void Function (String identifier) onSelectScreen;
  final String title;
  final IconData icon;

  String get titleFormat {
    return title[0].toUpperCase() +
        title.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color:  Theme.of(context).colorScheme.primaryContainer,),
      child: ListTile(
        // enableFeedback: true,
        leading: Icon(icon,
          color: Theme.of(context).colorScheme.onBackground,
          size: 25,
        ),
        title: Text(
          titleFormat,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 18
          ),
          ),
        onTap: (){
          onSelectScreen(title);
        },
    
      ),
    );
  }
  
}