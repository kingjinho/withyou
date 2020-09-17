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
  static TextEditingController _textEditingController = TextEditingController();

  static Future<T> show<T>(
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
    shouldShowYesOrNo = showYesOrNo;
    positiveBtnText = positiveBtnTitle ?? "Ok";
    negativeBtnText = negativeBtnTitle ?? "No";

    _textEditingController.clear();

    return Platform.isIOS
        ? await openDialogForIOS<T>()
        : await openDialogForAndroid<T>();
  }

  static Future<T> openDialogForAndroid<T>() async {
    AlertDialog dlg = AlertDialog(
      title: Text(titleText),
      content: type == DialogType.textInput
          ? TextFormField(
              controller: _textEditingController,
              maxLength: 20,
              validator: (value) {
                if (value.isEmpty) return 'should type something';
                return null;
              },
            )
          : Text(contentText),
      actions: _getButtonsForAndroid(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );

    return await showDialog<T>(
        context: context, barrierDismissible: true, builder: (_) => dlg);
  }

  static Future<T> openDialogForIOS<T>() async {
    CupertinoAlertDialog dlg = CupertinoAlertDialog(
      title: Text(titleText),
      content: type == DialogType.textInput
          ? TextFormField(
              controller: _textEditingController,
              maxLength: 30,
              validator: (value) {
                if (value.isEmpty) return 'should type something';
                return null;
              },
            )
          : Text(contentText),
      actions: _getButtonsForIOS(),
    );
    return showCupertinoDialog<T>(
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
            Navigator.pop(
                context,
                type == DialogType.textInput
                    ? _textEditingController.text.toString()
                    : false);
          },
          child: Text(negativeBtnText)));
    }
    buttons.add(FlatButton(
        onPressed: () {
          Navigator.pop(
              context,
              type == DialogType.textInput
                  ? _textEditingController.text.toString()
                  : false);
        },
        child: Text(positiveBtnText)));

    return buttons;
  }

  static List<Widget> _getButtonsForIOS() {
    List<Widget> buttons = List();

    if (type == DialogType.yesOrNo) {
      buttons.add(CupertinoDialogAction(
        child: Text(negativeBtnText),
        onPressed: () {
          Navigator.pop(
              context,
              type == DialogType.textInput
                  ? _textEditingController.text.toString()
                  : false);
        },
      ));
    }
    buttons.add(CupertinoDialogAction(
      child: Text(positiveBtnText),
      onPressed: () {
        Navigator.pop(
            context,
            type == DialogType.textInput
                ? _textEditingController.text.toString()
                : true);
      },
    ));

    return buttons;
  }
}

enum DialogType { about, info, warning, yesOrNo, textInput }
