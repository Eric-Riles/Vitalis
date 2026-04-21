import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/widgets/achievements_widget.dart';
import 'package:flutter_application_1/widgets/exerciseList_widget.dart';
import 'package:flutter_application_1/widgets/leveling_widget.dart';
import 'package:flutter_application_1/widgets/streak_widget.dart';
import 'package:flutter_application_1/widgets/week_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Column(
              spacing: 10.0,
              children: [
                StreakWidget(),
                LevelingWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeekWidget(),
                    AchievementsWidget()
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: dailyExerciseInfoNotifer,
                  builder: (context, info, child) {
                    return ExerciselistWidget(infos: info);
                  }
                ),
              ],
            ),
        ),
      ),
    );
  }
}