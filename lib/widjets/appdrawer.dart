import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
              Theme.of(context).colorScheme.primaryContainer.withBlue(300),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),
          ), 
          child: Row(
            children: [
              Icon(Icon.)
              SizedBox(height: 18,),
              Text("Hold your Tummies", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
                ),
              ),
            ],
          )
          
        )
      ],
    );

  }
  
}