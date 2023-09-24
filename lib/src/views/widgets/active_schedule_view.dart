import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/config/palette.dart';
import 'package:scheduler_app/services/providers/schedule_provider.dart';

class ActiveScheduleView extends StatelessWidget {
  const ActiveScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, scheduleProviderModel, child) => RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 36),
          children: <TextSpan>[
            TextSpan(
                text: 'Youre available in ',
                style: TextStyle(
                    fontFamily: 'Schyler',
                    color: ColorPalette().greyTextColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: '${scheduleProviderModel.shedulestring1}',
                style: TextStyle(
                    fontFamily: 'Schyler',
                    color: ColorPalette().textColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: scheduleProviderModel.shedulestring2 == null ? "" : '& ',
                style: TextStyle(
                    fontFamily: 'Schyler',
                    color: ColorPalette().greyTextColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: scheduleProviderModel.shedulestring2 ?? "",
                style: TextStyle(
                    fontFamily: 'Schyler',
                    color: ColorPalette().textColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w400))
          ],
        ),
        textScaleFactor: 0.5,
      ),
    );
  }
}
