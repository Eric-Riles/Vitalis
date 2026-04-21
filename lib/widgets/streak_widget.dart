import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/streak_page.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){return StreakPage();})),
      child: Container(
        width: double.maxFinite,
        height: 150.0,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepOrange, Colors.pink]
          ),
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
                Stack( // Flame Icon
                  children: [
                    Icon(
                      Icons.circle,
                      color:Color.fromARGB(50, 255, 255, 255),
                      size: 90,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ValueListenableBuilder(
                        valueListenable: exerscisedTodayNotifier,
                        builder: (context, exerscisedToday, child) {
                          return Icon(
                            Icons.local_fire_department,
                            color: exerscisedToday ? Colors.amber[600] : Colors.white70,
                            size: 70,
                          );
                        }
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
                            'Current Streak',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Longest Streak',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: currentStreakNotifier,
                            builder: (context, currentStreak, child) {
                              return Text(
                                '$currentStreak',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            }
                          ),
                          ValueListenableBuilder(
                            valueListenable: longestStreakNotifier,
                            builder: (context, longestStreak, child) {
                              return Text(
                                '$longestStreak',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text( 
                'Keep it up! Complete today\'s exercises to maintain your streak!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}