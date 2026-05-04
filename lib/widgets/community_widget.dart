import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class CommunityWidget extends StatelessWidget {
  final String title;
  final String desc;

  const CommunityWidget({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, child) {
        return Container(
          width: double.infinity,
          height: 150,
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
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(CupertinoIcons.group_solid, size: 40,),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 40,
                children: [
                  FilledButton(
                    onPressed: () => print('pressed'),
                    child: Text('Join')
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}