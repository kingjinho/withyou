import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  NeumorphicButton(
      {this.width,
      this.height,
      this.text,
      this.icon,
      this.backgroundColor,
      this.borderRadius,
      this.onPressed});

  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Icon icon;
  final Text text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFFEAEBF3),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 15)),
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
          ]),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon],
      )),
    );
  }
}
