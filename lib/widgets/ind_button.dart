import 'package:blogexplorer/screens/home.dart';
import 'package:blogexplorer/utils/navigators.dart';
import 'package:flutter/material.dart';

class IndButtonWidget extends StatelessWidget {
  final Color textColor;
  final Color boxColor;
  final Color borderColor;
  final String text;
  const IndButtonWidget(
      {super.key,
      required this.textColor,
      required this.borderColor,
      required this.text,
      required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators().screenReplacement(context, const HomeScreen());
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.75,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
            color: boxColor),
        child: Text(
          text,
          style: TextStyle(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
