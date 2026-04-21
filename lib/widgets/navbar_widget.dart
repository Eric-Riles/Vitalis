import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier, 
      builder: (context, selectedPage, child) {
        return  NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            NavigationDestination(
              icon: Icon(Icons.people),
              label: 'Community'
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              label: 'Info',
            ),
            NavigationDestination(
              icon: Icon(Icons.messenger_rounded), 
              label: 'Messages'
            ),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      }
    );
  }
}