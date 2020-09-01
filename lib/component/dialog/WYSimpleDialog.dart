import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WYSimpleDialog {
  static BuildContext context;
  static DialogType type;
  static String titleText;
  static String contentText;
  static bool shouldShowYesOrNo;
  static String positiveBtnText;
  static String negativeBtnText;

  static Future<bool> show(
      BuildContext buildContext,
      DialogType dlgType,
      String title,
      String content,
      bool showYesOrNo,
      String positiveBtnTitle,
      String negativeBtnTitle) async {
    context = buildContext;
    type = dlgType;
    titleText = title;
    contentText = content;
    shouldShowYesOrNo = shouldShowYesOrNo;
    positiveBtnText = positiveBtnTitle ?? "Ok";
    negativeBtnText = negativeBtnTitle ?? "No";

    return Platform.isIOS
        ? await openDialogForIOS()
        : await openDialogForAndroid();
  }

  static Future<bool> openDialogForAndroid() async {
    AlertDialog dlg = AlertDialog(
      title: Text(titleText),
      content: Text(contentText),
      actions: _getButtonsForAndroid(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );

    return await showDialog<bool>(
        context: context, barrierDismissible: true, builder: (_) => dlg);
  }

  static Future<bool> openDialogForIOS() async {
    CupertinoAlertDialog dlg = CupertinoAlertDialog(
      title: Text(titleText),
      content: Text(contentText),
      actions: [
        CupertinoDialogAction(
          child: Text(negativeBtnText),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(positiveBtnText),
        )
      ],
    );
    return showCupertinoDialog<bool>(
      context: context,
      builder: (_) => dlg,
      barrierDismissible: true,
    );
  }

  static List<Widget> _getButtonsForAndroid() {
    List<Widget> buttons = List();

    if (type == DialogType.yesOrNo) {
      buttons.add(FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(negativeBtnText)));
    } else {
      buttons.add(FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(positiveBtnText)));
    }
    return buttons;
  }

  static List<Widget> _getButtonsForIOS() {
    List<Widget> buttons = List();

    if (type == DialogType.yesOrNo) {
      buttons.add(CupertinoDialogAction(
        child: Text(negativeBtnText),
        onPressed: () {
          Navigator.pop(context, false);
        },
      ));
    } else {
      buttons.add(CupertinoDialogAction(
        child: Text(positiveBtnText),
        onPressed: () {
          Navigator.pop(context, false);
        },
      ));
    }
    return buttons;
  }
}

enum DialogType { about, info, warning, yesOrNo }
