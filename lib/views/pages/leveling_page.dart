import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/historyItem_widget.dart';
import 'package:flutter_application_1/widgets/leveling_widget.dart';

class LevelingPage extends StatelessWidget {
  const LevelingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leveling'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 10,
          children: [
            AbsorbPointer(absorbing: true, child: LevelingWidget()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 5,
              radius: BorderRadiusGeometry.all(Radius.circular(10)),
            ),
            HistoryItemWidget(),
          ],
        ),
      )
    );
  }
}