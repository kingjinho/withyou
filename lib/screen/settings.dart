import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:withyou/component/dialog/WYSimpleDialog.dart';
import 'package:withyou/screen/About.dart';
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
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(3.0, 3.0),
                      spreadRadius: 1.0,
                      blurRadius: 5.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5.0, -5.0),
                      spreadRadius: 2.0,
                      blurRadius: 10.0)
                ]),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ));
              },
              splashColor: colorNeuWhite,
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[500],
                                  offset: Offset(3.0, 3.0),
                                  spreadRadius: 1.0,
                                  blurRadius: 5.0),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-5.0, -5.0),
                                  spreadRadius: 1.0,
                                  blurRadius: 5.0)
                            ]),
                        child: MaterialButton(
                          splashColor: colorNeuWhite,
                          onPressed: () {
                            StoreRedirect.redirect(
                                androidAppId: "com.iyaffle.rangoli",
                                iOSAppId: "585027354");
                          },
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
                      ),
                      Container(
                          width: width / 2 - 8,
                          height: width / 2 - 8,
                          decoration: BoxDecoration(
                              color: colorNeuGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(4.0, 4.0),
                                    spreadRadius: 1.0,
                                    blurRadius: 5.0)
                              ]),
                          child: MaterialButton(
                            onPressed: () {},
                            splashColor: colorNeuWhite,
                            child: Center(
                              child: Image.asset(
                                "assets/images/ear.png",
                                width: 60,
                                height: 60,
                              ),
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
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: colorNeuGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(3.0, 3.0),
                                    spreadRadius: 1.0,
                                    blurRadius: 5.0)
                              ]),
                          child: MaterialButton(
                            splashColor: colorNeuWhite,
                            onPressed: () {
                              WYSimpleDialog.show(
                                      context,
                                      DialogType.yesOrNo,
                                      "For Real!?",
                                      "Wanna Replace Your Partner? :)))))",
                                      true,
                                      "Replace",
                                      "Nah")
                                  .then((isYes) => {if (isYes) {}});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "New One?? ",
                                  style: TextStyle(
                                      fontSize: 52, color: colorNeuWhite),
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  "assets/images/woman_shrugging.png",
                                  width: 48,
                                  height: 48,
                                ),
                                Image.asset(
                                  "assets/images/man_shrugging.png",
                                  width: 48,
                                  height: 48,
                                ),
                              ],
                            ),
                          ),
                        )),
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                        flex: 4,
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: colorNeuGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      offset: Offset(3.0, 3.0),
                                      spreadRadius: 1.0,
                                      blurRadius: 5.0),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5.0, -5.0),
                                      spreadRadius: 1.0,
                                      blurRadius: 5.0)
                                ]),
                            child: MaterialButton(
                              onPressed: () {
                                WYSimpleDialog.show(
                                        context,
                                        DialogType.yesOrNo,
                                        "For Real!?",
                                        "You Sure About that?",
                                        true,
                                        "Yes",
                                        null)
                                    .then((isYes) => {if (isYes) {}});
                              },
                              splashColor: colorNeuWhite,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "End Jouney",
                                          style: TextStyle(
                                              fontSize: 52,
                                              color: colorNeuWhite),
                                        )),
                                    Image.asset(
                                      "assets/images/drop_of_blood.png",
                                      width: 48,
                                      height: 48,
                                    )
                                  ],
                                ),
                              ),
                            ))),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
