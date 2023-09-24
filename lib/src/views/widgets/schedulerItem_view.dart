// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, file_names

import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:scheduler_app/config/palette.dart';
import 'package:scheduler_app/services/providers/day_provider.dart';
import 'package:scheduler_app/services/providers/schedule_provider.dart';
import 'package:scheduler_app/src/res/constants.dart';

class SchedulerItemView extends StatefulWidget {
  SchedulerItemView(this.count, {super.key});
  late var count;

  @override
  State<SchedulerItemView> createState() => _SchedulerItemViewState();
}

class _SchedulerItemViewState extends State<SchedulerItemView> {
  List<int> selectedlist = [];

  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
        builder: (context, scheduleProviderModel, child) {
      return Row(
        children: [
          RoundCheckBox(
            isChecked: active,
            uncheckedWidget: Icon(Icons.check,
                size: 14, color: ColorPalette().checkboxInactiveColor),
            checkedWidget:
                const Icon(Icons.check, size: 14, color: Colors.white),
            size: 22,
            onTap: (selected) {
              active = !active;

              if (active == true) {
                scheduleProviderModel.selectSchedules(widget.count, [0, 1, 2]);
              } else {
                scheduleProviderModel.clearAll();
              }
              setState(() {});
            },
          ),
          const SizedBox(
            width: 8,
          ),
          _daybuilder(widget.count),
          Visibility(
            visible: active,
            replacement: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Unavailable",
                style: TextStyle(
                    fontFamily: 'Schyler',
                    color: ColorPalette().greyTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            child: ChipList(
              extraOnToggle: (index) {
                scheduleProviderModel.selectSchedules(
                    widget.count, selectedlist);
                setState(() {});
              },
              listOfChipNames: AppConstants().sheduleTimings,
              borderRadiiList: const [8],
              supportsMultiSelect: true,
              activeBgColorList: const [Colors.white],
              inactiveBgColorList: const [Colors.white],
              activeTextColorList: [ColorPalette().chipActiveTexColor],
              inactiveTextColorList: [ColorPalette().chipInactiveTextColor],
              listOfChipIndicesCurrentlySeclected: selectedlist,
              inactiveBorderColorList: [ColorPalette().chipInactiveBorderColor],
              activeBorderColorList: [ColorPalette().chipActiveBorderColor],
            ),
          ),
        ],
      );
    });
  }

  _daybuilder(count) {
    return Consumer<Dayprovider>(
      builder: (context, dayProviderModel, child) => SizedBox(
        height: 20,
        width: 60,
        child: ListView.builder(
          itemCount: dayProviderModel.days.length,
          itemBuilder: (context, index) {
            return Text(
              dayProviderModel.days[count],
              style: TextStyle(
                  fontFamily: 'Schyler',
                  color: ColorPalette().textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            );
          },
        ),
      ),
    );
  }
}
