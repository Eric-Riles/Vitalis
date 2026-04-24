import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/exerciseInfo.dart';
//temp
ValueNotifier<int> selectedPageNotifier = ValueNotifier<int>(0);
ValueNotifier<bool> darkModeNotifier = ValueNotifier<bool>(true);
ValueNotifier<int> currentStreakNotifier = ValueNotifier(0);
ValueNotifier<int> longestStreakNotifier = ValueNotifier(0);
ValueNotifier<bool> exerscisedTodayNotifier = ValueNotifier(false);
ValueNotifier<int> levelNotifier = ValueNotifier(0);
ValueNotifier<int> totalXpNotifier = ValueNotifier(0);
ValueNotifier<int> weeksNotifier = ValueNotifier(5);
ValueNotifier<int> currentWeeksNotifier = ValueNotifier(0);
ValueNotifier<List<int>> achievementsNotifier = ValueNotifier([0, 1, 2, 9]);
ValueNotifier<List<Exerciseinfo>> dailyExerciseInfoNotifer = ValueNotifier([
  Exerciseinfo(false, 'exercise', 190),
  Exerciseinfo(false, 'exercise', 50),
  Exerciseinfo(false, 'exercise', 160),
  Exerciseinfo(false, 'exercise', 120),
]);