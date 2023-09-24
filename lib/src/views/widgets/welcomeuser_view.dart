import 'package:flutter/material.dart';
import 'package:scheduler_app/config/palette.dart';
import 'package:scheduler_app/src/res/constants.dart';

class WelcomeUserView extends StatelessWidget {
  const WelcomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello ${AppConstants.userName}!",
            style: TextStyle(
                fontFamily: 'Schyler',
                color: ColorPalette().textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        Text("Lets get started",
            style: TextStyle(
                fontFamily: 'Schyler',
                color: ColorPalette().greyTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400))
      ],
    );
  }
}
