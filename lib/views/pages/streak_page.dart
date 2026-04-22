import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/streak_widget.dart';

class StreakPage extends StatelessWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AbsorbPointer(absorbing: true, child: StreakWidget()),
      )
    );
  }
}