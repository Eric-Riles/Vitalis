import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/exerciseInfo.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class ExerciseItemWidget extends StatefulWidget {
  final Exerciseinfo info;
  const ExerciseItemWidget(
    {
      super.key,
      required this.info
    }
  );

  @override
  State<ExerciseItemWidget> createState() => _ExerciseItemWidgetState();
}

class _ExerciseItemWidgetState extends State<ExerciseItemWidget> {
  @override
  Widget build(BuildContext context) {
    Widget left = SizedBox.shrink();
    if(widget.info.completion){
      left = Stack(children: [
          Icon(
            Icons.circle,
            color: Colors.green.withAlpha(60),
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              CupertinoIcons.checkmark,
              color: Colors.green,
              size: 30,
            ),
          ),
        ]
      );
    }else{
      left = Stack(children: [
          Icon(
            Icons.circle,
            color: Colors.purple.withAlpha(60),
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.purple,
              size: 30,
            ),
          ),
        ]
      );
    }
    return ValueListenableBuilder(
      valueListenable: totalXpNotifier,
      builder: (context, xp, child) {
        return GestureDetector(
          onTap: widget.info.completion ? () => print('previously Completed') : () {totalXpNotifier.value += widget.info.xp; widget.info.completion = true; setState(() {});},
          child: ValueListenableBuilder(
            valueListenable: darkModeNotifier,
            builder: (context, isDark, child) {
              return Stack(
                children: [ 
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 75,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isDark ? darkColor : lightColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(60),
                          spreadRadius: .1,
                          blurRadius: 1,
          
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        left,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.info.exercise,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,              
                              ),
                            ),
                            Text(
                              '+${widget.info.xp} XP',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  widget.info.completion ? Container(
                    height: 75,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isDark ?Colors.black.withAlpha(60) : Colors.grey.withAlpha(70)
                    ),
                  ) : Container(),
                ]
              );
            }
          ),
        );
      }
    );
  }
}