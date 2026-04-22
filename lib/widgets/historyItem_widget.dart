import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, child) {
        return Container(
          width: double.maxFinite,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isDark ? darkColor : lightColor,
          ),
          child: Row(
            children: [
              Text('')
            ],
          ),
        );
      }
    );
  }
}