import 'package:blogexplorer/widgets/ind_button.dart';
import 'package:blogexplorer/utils/spacers.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            YSpace(100),
            const Text(
              "BLOG EXPLORER",
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            const Text("Personal Blogging Space"),
            Image.asset(
              "assets/images/onboard.png",
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const IndButtonWidget(
                borderColor: Colors.black,
                textColor: Colors.black,
                text: "LOGIN",
                boxColor: Colors.white),
            YSpace(30),
            const IndButtonWidget(
                borderColor: Colors.white,
                textColor: Colors.white,
                text: "REGISTER",
                boxColor: Colors.black),
            const Text("New here?"),
          ],
        ),
      ),
    );
  }
}
