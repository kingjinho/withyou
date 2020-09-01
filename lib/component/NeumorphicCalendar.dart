import 'package:flutter/material.dart';
import 'package:withyou/shared/Colors.dart';

class NeumorphicCalendar extends StatelessWidget {
  NeumorphicCalendar(this.width, this.height, this.backgroundColor,
      this.headerText, this.contentText, this.headerWeight, this.contentWeight);

  final double width;
  final double height;
  final Color backgroundColor;
  final Text headerText;
  final int headerWeight;
  final Text contentText;
  final int contentWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              flex: headerWeight,
              child: Container(
                decoration: BoxDecoration(
                    color: colorNeuPink,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                alignment: Alignment.center,
                child: headerText,
              )),
          Flexible(
              flex: contentWeight,
              child: Container(
                decoration: BoxDecoration(
                    color: colorNeuWhite,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500],
                          offset: Offset(10.0, 10.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                alignment: Alignment.center,
                child: contentText,
              )),
        ],
      ),
    );
  }
}
