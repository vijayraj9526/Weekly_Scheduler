import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/config/palette.dart';
import 'package:scheduler_app/services/providers/schedule_provider.dart';
import 'package:scheduler_app/src/res/constants.dart';
import 'package:scheduler_app/src/views/scheduler.dart';
import 'package:scheduler_app/src/views/widgets/active_schedule_view.dart';
import 'package:scheduler_app/src/views/widgets/empty_view.dart';
import 'package:scheduler_app/src/views/widgets/welcomeuser_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingactionButton(context),
    );
  }

  _buildAppbar() {
    return AppBar(
      leadingWidth: 100,
      leading: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: AppConstants.spaceV16,
          ),
          Image(image: AssetImage(AppConstants.appLogo)),
        ],
      ),
    );
  }

  _buildBody() {
    return Consumer<ScheduleProvider>(
      builder: (context, scheduleProviderModel, child) {
        return scheduleProviderModel.activeSchedules.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: WelcomeUserView()),
                    Spacer(),
                    EmptyView(),
                    Spacer(),
                  ],
                ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: WelcomeUserView()),
                    Spacer(),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ActiveScheduleView()),
                    Spacer(),
                  ],
                ),
              );
      },
    );
  }

  _buildFloatingactionButton(context) {
    return Consumer<ScheduleProvider>(
        builder: (context, scheduleProviderModel, child) {
      return FloatingActionButton(
        backgroundColor: ColorPalette().buttonColor,
        onPressed: () {
          scheduleProviderModel.clearAll();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SchedulerView()),
          );
        },
        elevation: 15,
        child: scheduleProviderModel.activeSchedules.isEmpty
            ? const Icon(Icons.add)
            : const Icon(Icons.edit),
      );
    });
  }
}
