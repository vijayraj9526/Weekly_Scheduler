import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/config/palette.dart';
import 'package:scheduler_app/services/providers/schedule_provider.dart';
import 'package:scheduler_app/src/res/constants.dart';
import 'package:scheduler_app/src/views/widgets/schedulerItem_view.dart';

class SchedulerView extends StatelessWidget {
  const SchedulerView({super.key});

  get count => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(context) {
    return AppBar(
      leadingWidth: 300,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          const SizedBox(
            width: AppConstants.spaceV16,
          ),
          const Image(image: AssetImage(AppConstants.appLogo)),
        ],
      ),
    );
  }

  _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Set your weekly hours",
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      color: ColorPalette().textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
          const SizedBox(
            height: AppConstants.spaceH16,
          ),
          const Divider(height: 10, thickness: 2),
          Expanded(
              child: ListView.separated(
            itemCount: 7,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 10, thickness: 2),
            itemBuilder: (BuildContext context, int index) {
              return SchedulerItemView(index);
            },
          )),
          _buildSaveButton(context)
        ],
      ),
    );
  }

  _buildSaveButton(context) {
    return Consumer<ScheduleProvider>(
      builder: (context, scheduleProviderModel, child) => SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              scheduleProviderModel.saveSchedule();
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorPalette().buttonColor)),
            child: const Text("Save"),
          )),
    );
  }
}
