import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/animation/empty_scheduler.json'),
        const Text("Things look empty here.Tap  + to Add Schedule",
            style: TextStyle(
                fontFamily: 'Schyler',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500))
      ],
    );
  }
}
