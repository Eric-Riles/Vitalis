import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/exerciseInfo.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/widgets/historyItem_widget.dart';

class HistoryListWidget extends StatelessWidget {
  final List<Exerciseinfo> infos;

  const HistoryListWidget({super.key, required this.infos});

  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, child) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isDark ? darkColor : lightColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(60),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 3)
              ),
            ],
          ),
          child: Column(
            spacing: 10,
            children: [
              for(Exerciseinfo info in infos) if(info.completion) (HistoryItemWidget(info: info))
            ],
          ),
        );
      }
    );
  }
}