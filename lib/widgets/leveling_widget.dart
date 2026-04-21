import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/leveling_page.dart';
import 'package:flutter_application_1/widgets/progressBar_widget.dart';

class LevelingWidget extends StatefulWidget {
  const LevelingWidget({super.key});

  @override
  State<LevelingWidget> createState() => _LevelingWidgetState();
}

class _LevelingWidgetState extends State<LevelingWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){return LevelingPage();})),
      child: ValueListenableBuilder(
        valueListenable: levelNotifier,
        builder: (context, level, child) {
          return ValueListenableBuilder(
            valueListenable: totalXpNotifier,
            builder: (context, totalXP, child) {
              return ValueListenableBuilder(
                valueListenable: darkModeNotifier,
                builder: (context, isDark, child) {
                  if(totalXP - level*xpThreshold >= xpThreshold){
                    level = (totalXP/xpThreshold).toInt();
                  }
                  return Container(
                    width: double.maxFinite,
                    height: 150.0,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDark ? darkColor : lightColor,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(60),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(2, 3)
                        ),
                      ]
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack( // Trophy Icon
                              children: [
                                Icon(
                                  Icons.circle,
                                  color:Colors.purple,
                                  size: 70,
                                ),
                                Container(
                                  padding: EdgeInsets.all(12.5),
                                  child: Icon(
                                    Icons.emoji_events,
                                    color: Colors.grey[200],
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              //Text next to streak thing
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Level',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Total XP',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '$level',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,                       
                                        ),
                                      ),
                                      Text(
                                        '${totalXP.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.bolt_rounded,
                                          color: Colors.amber,
                                        ),
                                        Text('Progress to level ${level + 1}'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${totalXP - level*xpThreshold} / 500 XP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              ProgressbarWidget(
                                progress: totalXP - level*500, 
                                maxValue: xpThreshold, 
                                progressBarColor: isDark ? Colors.grey[700] : Colors.grey[300], 
                                intcrementColor: Colors.purple, 
                                height: 20, 
                                width: double.maxFinite, 
                                margin: EdgeInsetsGeometry.fromLTRB(0, 10, 0, 0))  
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              );
            }
          );
        }
      ),
    );
  }
}