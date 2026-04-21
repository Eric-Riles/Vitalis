import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/darkMode_widget.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              DarkmodeWidget()
            ],
          ),
        ),
      ),
    );
  }
}