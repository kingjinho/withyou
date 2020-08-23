import 'package:flutter/material.dart';

class NeumorphicBackground extends StatelessWidget {
  NeumorphicBackground(this.width, this.height, this.backgroundColor,
      this.isHollow, this.borderRadius);

  final double width;
  final double height;
  final Color backgroundColor;
  final bool isHollow;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = isHollow
        ? BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 80)),
            boxShadow: [
                BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ])
        : BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 80)),
            boxShadow: [
                BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ]);

    return Container(
      width: width,
      height: height,
      decoration: decoration,
    );
  }
}
