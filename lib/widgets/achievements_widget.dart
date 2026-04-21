import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/achievements_page.dart';

class AchievementsWidget extends StatelessWidget {
  const AchievementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) { return AchievementsPage();})),
      child: ValueListenableBuilder(
        valueListenable: darkModeNotifier,
        builder: (context, isDark, child) {
          return Container(
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
                      color: Colors.amber.withAlpha(60)
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.all(15),
                      child: Icon(
                        Icons.military_tech_rounded,
                        size: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: achievementsNotifier,
                  builder: (context, achievements, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text('Achievements'),
                        ),
                        Text(
                          '${achievements.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25
                          ),
                        ),
                      ],
                    );
                  }
                )
              ],
            ),
          );
        }
      ),
    );
  }
}