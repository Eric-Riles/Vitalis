import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/data/globalConst.dart';



class DarkmodeWidget extends StatefulWidget {
  const DarkmodeWidget({super.key});

  @override
  State<DarkmodeWidget> createState() => _DarkmodeWidgetState();
}

class _DarkmodeWidgetState extends State<DarkmodeWidget>{
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDarkMode, child) {
        return ListTile(
          iconColor: isDarkMode ? Colors.amber : const Color.fromARGB(221, 25, 25, 25),
          title: isDarkMode ? Text('Light') : Text('Dark'),
          leading: isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          onTap: () async {
            darkModeNotifier.value = !darkModeNotifier.value;
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool(darkKey, darkModeNotifier.value);
          },
        );
      }
    );
  }
}