import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget {
  final bool isAndroid = Platform.isAndroid;
  double deviceWidth;
  double deviceHeight;

  @protected
  Widget createScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return createScreen(context);
  }
}
