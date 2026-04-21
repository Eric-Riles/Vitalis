import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, child) {
        return Container(
          padding: EdgeInsets.all(5),
          height: 100,
          width: (MediaQuery.of(context).size.width - 30)/2,
          decoration: BoxDecoration(
            color: isDark ? darkColor : lightColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(60),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 3)
              ),
            ],
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.circle,
                    size: 80,
                    color: Colors.purple.withAlpha(60)
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.all(15),
                    child: Icon(
                      Icons.adjust_sharp,
                      size: 50,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: weeksNotifier,
                builder: (context, weeks, child) {
                  return ValueListenableBuilder(
                    valueListenable: currentWeeksNotifier,
                    builder: (context, currentWeeks, child) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Column(
                          children: [
                            Text('Week'),
                            Text(
                              '$currentWeeks/$weeks',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  );
                }
              ),
            ],
          ),
        );
      }
    );
  }
}