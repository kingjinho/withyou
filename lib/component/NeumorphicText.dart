import 'package:flutter/material.dart';

class NeumorphicText extends StatelessWidget {
  NeumorphicText(this.text, this.width, this.height, this.style, this.align);

  final String text;
  final double width;
  final double height;
  final TextStyle style;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Align(
          alignment: this.align, child: Text(this.text, style: this.style)),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                blurRadius: 4,
                offset: Offset(6.0, 6.0),
                spreadRadius: 0.3),
            BoxShadow(
                color: Color.fromARGB(200, 255, 255, 255),
                offset: Offset(-5.0, -5.0),
                blurRadius: 4.0,
                spreadRadius: 0.3),
          ]),
    );
  }
}
