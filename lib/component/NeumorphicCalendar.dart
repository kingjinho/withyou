import 'package:flutter/material.dart';

class NeumorphicCalendar extends StatelessWidget {
  NeumorphicCalendar(
      this.width,
      this.height,
      this.headerBackgroundColor,
      this.contentBackgroundColor,
      this.headerText,
      this.contentText,
      this.headerWeight,
      this.contentWeight,
      this.borderRadius);

  final double width;
  final double height;
  final Color headerBackgroundColor;
  final Color contentBackgroundColor;
  final Text headerText;
  final int headerWeight;
  final Text contentText;
  final int contentWeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _createCalendarView(),
      ),
    );
  }

  List<Widget> _createCalendarView() {
    List<Widget> list = List();
    if (headerWeight != 0) {
      list.add(Flexible(
          flex: headerWeight,
          child: Container(
            decoration: BoxDecoration(
                color: headerBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius))),
            alignment: Alignment.center,
            child: headerText,
          )));
    }
    list.add(Flexible(
        flex: contentWeight,
        child: Container(
          decoration: BoxDecoration(
              color: contentBackgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(10.0, 10.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ],
              borderRadius: headerWeight != 0
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius))
                  : BorderRadius.all(Radius.circular(borderRadius))),
          alignment: Alignment.center,
          child: contentText,
        )));

    return list;
  }
}
