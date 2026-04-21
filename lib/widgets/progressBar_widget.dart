import 'package:flutter/material.dart';

class ProgressbarWidget extends StatelessWidget {
  final int progress;
  final int maxValue;
  final Color? progressBarColor;
  final Color? intcrementColor;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;

  const ProgressbarWidget({
    super.key, 
    required this.progress, 
    required this.maxValue, 
    this.progressBarColor = Colors.white, 
    this.intcrementColor = Colors.black, 
    required this.height, 
    required this.width, 
    this.margin = const EdgeInsetsGeometry.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: margin,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: progressBarColor,
            borderRadius: BorderRadius.circular(height/2),
          ),
        ),
        Container(
          margin: margin,
          width: (MediaQuery.of(context).size.width - 30) * (progress/maxValue),
          height: height,
          decoration: BoxDecoration(
            color: intcrementColor,
            borderRadius: BorderRadius.circular(height/2),
          ),
        ),
      ],
    );
  }
}