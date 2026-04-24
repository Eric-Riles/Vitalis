import 'package:flutter/cupertino.dart';
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
              icon: Icon(CupertinoIcons.home),
              label: 'Home'
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.group_solid),
              label: 'Community'
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.info),
              label: 'Info',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.text_bubble), 
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