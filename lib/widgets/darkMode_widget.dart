import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class DarkmodeWidget extends StatelessWidget {
  const DarkmodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDarkMode, child) {
        return ListTile(
          iconColor: isDarkMode ? Colors.amber : const Color.fromARGB(221, 25, 25, 25),
          title: isDarkMode ? Text('Light') : Text('Dark'),
          leading: isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          onTap: () {
            darkModeNotifier.value = !darkModeNotifier.value;
          },
        );
      }
    );
  }
}