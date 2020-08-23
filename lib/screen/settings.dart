import 'package:flutter/material.dart';
import 'package:withyou/shared/Colors.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;

    return SafeArea(
        child: Container(
      color: colorNeuWhite,
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Container(
            height: width - 64,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: colorNeuGrey,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/women_rasing_hand.png",
                    width: 110,
                    height: 110,
                  ),
                  Image.asset(
                    "assets/images/man_raising_hand.png",
                    width: 110,
                    height: 110,
                  )
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width / 2 - 8,
                        height: width / 2 - 8,
                        decoration: BoxDecoration(
                            color: colorNeuGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/thumbs_up.png",
                                width: 60,
                                height: 60,
                              ),
                              Image.asset(
                                "assets/images/thumbs_down.png",
                                width: 60,
                                height: 60,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: width / 2 - 8,
                          height: width / 2 - 8,
                          decoration: BoxDecoration(
                              color: colorNeuGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Image.asset(
                              "assets/images/ear.png",
                              width: 60,
                              height: 60,
                            ),
                          )),
                    ],
                  ),
                ),
              )),
          Flexible(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(bottom: 16, top: 16),
                child: Column(
                  children: [
                    Flexible(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorNeuGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: [
                              Text("new one??"),
                              Image.asset(
                                "assets/images/woman_shrugging.png",
                                width: 70,
                                height: 70,
                              ),
                              Image.asset(
                                "assets/images/man_shrugging.png",
                                width: 70,
                                height: 70,
                              ),
                            ],
                          ),
                        )),
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorNeuGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        )),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
