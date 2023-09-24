import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/config/themes/app_themes.dart';
import 'package:scheduler_app/services/providers/day_provider.dart';
import 'package:scheduler_app/services/providers/schedule_provider.dart';
import 'package:scheduler_app/src/res/constants.dart';
import 'package:scheduler_app/src/views/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScheduleProvider()),
        ChangeNotifierProvider(create: (context) => Dayprovider())
      ],
      child: MaterialApp(
        theme: theme(),
        title: AppConstants.appName,
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
