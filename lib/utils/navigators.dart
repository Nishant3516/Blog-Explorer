import 'package:flutter/material.dart';

class Navigators {
  void screenReplacement(BuildContext context, Widget newScreen) {
    Navigator.push(context, MaterialPageRoute(builder: (c) => newScreen));
  }

  void screenPushReplacement(BuildContext context, Widget newScreen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => newScreen));
  }
}
