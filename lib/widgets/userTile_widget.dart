import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class UserTileWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const UserTileWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, child) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? darkColor : lightColor,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
        );
      }
    );
  }
}