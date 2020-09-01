import 'package:flutter/material.dart';
import 'package:withyou/screen/BaseScreen.dart';
import 'package:withyou/shared/Colors.dart';

class About extends BaseScreen {
  // About({Key key}) : super(key: key);

  final defaultTitleStyle =
      TextStyle(color: colorNeuGrey, fontFamily: "DoHyeon", fontSize: 20);

  final defaultContentStyle =
      TextStyle(color: colorNeuGrey, fontSize: 16, fontFamily: "DoHyeon");

  @override
  Widget createScreen(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: colorNeuPink,
              title: Text("WithYou"),
              leading: IconButton(
                icon: Icon(isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
            body: Container(
              width: deviceWidth,
              height: deviceHeight,
              padding: EdgeInsets.all(16),
              color: colorNeuWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thank You For Using WithYou !",
                    style: TextStyle(fontSize: 32, color: colorNeuGrey),
                  ),
                  Text(
                    "Hope You Love it :)",
                    style: TextStyle(fontSize: 32, color: colorNeuGrey),
                  ),
                  Text("From Jinho in Aug 26th of 2020, Somewhere in Seoul"),
                  RichText(
                      text: TextSpan(
                          style: defaultTitleStyle,
                          children: <TextSpan>[
                        TextSpan(text: "What WithYou "),
                        TextSpan(
                            text: "Cannot",
                            style: TextStyle(
                                color: colorNeuPink,
                                fontSize: 40,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                          text: "  Offer :)",
                        )
                      ])),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: colorNeuGrey,
                              fontSize: 16,
                              fontFamily: "DoHyeon"),
                          children: <TextSpan>[
                        TextSpan(text: "- "),
                        TextSpan(
                            text: "Does not sync",
                            style: TextStyle(
                                color: colorNeuPink,
                                fontSize: 16,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                          text:
                              " with your new mobile phone (after releasing Game Section)",
                        )
                      ])),
                  RichText(
                      text: TextSpan(
                          style: defaultTitleStyle,
                          children: <TextSpan>[
                        TextSpan(text: "What WithYou "),
                        TextSpan(
                            text: "Will",
                            style: TextStyle(
                                color: colorNeuPink,
                                fontSize: 40,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                          text: "  Offer ",
                        )
                      ])),
                  RichText(
                      text: TextSpan(
                          style: defaultContentStyle,
                          children: <TextSpan>[
                        TextSpan(text: " - Game"),
                      ])),
                  RichText(
                      text: TextSpan(
                          style: defaultContentStyle,
                          children: <TextSpan>[
                        TextSpan(text: " - Syncing"),
                      ])),
                  RichText(
                      text: TextSpan(
                          style: defaultTitleStyle,
                          children: <TextSpan>[
                        TextSpan(text: "Speical Thanks To"),
                      ])),
                  RichText(
                      text: TextSpan(
                          style: defaultContentStyle,
                          children: <TextSpan>[
                        TextSpan(text: " - Font : Dohyeon"),
                      ])),
                ],
              ),
            )),
      ),
    );
  }
}
