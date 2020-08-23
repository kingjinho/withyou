import 'package:flutter/material.dart';
import 'package:withyou/component/NeumorphicBackground.dart';
import 'package:withyou/component/NeumorphicButton.dart';
import 'package:withyou/component/NeumorphicCalendar.dart';
import 'package:withyou/shared/Colors.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      color: Color(0xFFEAEBF3),
      child: Column(
        children: [
          Flexible(
              flex: 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  NeumorphicBackground(
                      350, height * .4, Color(0xFFEAEBF3), false, 15),
                  Column(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Text(
                                "He is Coming!!!",
                                style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w600,
                                    color: colorNeuGrey),
                              ))),
                      Flexible(
                          flex: 3,
                          child: Container(
                            width: width * .5,
                            child: NeumorphicCalendar(
                                width * .5,
                                width * .5,
                                Color(0xFFEAEBF3),
                                Text("May",
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xff545454))),
                                Text(
                                  "26th",
                                  style: TextStyle(
                                      fontSize: 48, color: Color(0xff545454)),
                                ),
                                1,
                                3),
                          ))
                    ],
                  )
                ],
              )),
          Flexible(
              flex: 1,
              child: Container(
                height: height * .23,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              NeumorphicBackground(
                                  100, 100, Color(0xFFEAEBF3), true, 15),
                              Icon(
                                Icons.add,
                                color: Color(0xff545454),
                                size: 40,
                              )
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                            child: Image.asset(
                          "assets/images/heart.png",
                          width: 80,
                          height: 80,
                        ))),
                    Flexible(
                        flex: 1,
                        child: Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              NeumorphicBackground(
                                  100, 100, Color(0xFFEAEBF3), true, 15),
                              Icon(
                                Icons.add,
                                color: Color(0xff545454),
                                size: 40,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          Flexible(
              flex: 2,
              child: Container(
                height: height * .33,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          "Dating Since...",
                          style: TextStyle(fontSize: 32, color: colorNeuGrey),
                        )),
                    Flexible(
                        flex: 3,
                        child: Container(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: NeumorphicButton(
                              height: 120,
                              icon: Icon(
                                Icons.add,
                                color: Color(0xff545454),
                                size: 64,
                              ),
                              backgroundColor: Color(0xFFEAEBF3),
                            ),
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
