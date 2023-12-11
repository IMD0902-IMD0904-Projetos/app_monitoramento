import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:PresenceMonitor/app/theme/text_theme.dart';
import 'package:lottie/lottie.dart';

import '../controllers/init_screen_controller.dart';

class InitScreenView extends GetView<InitScreenController> {
  const InitScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<InitScreenController>(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/presenceMonitor.json',
                controller: _.animationController,
                frameRate: FrameRate(60),
                repeat: true,
                width: Get.width * 0.75,
                onLoaded: (composition) {
                  _.animationController.duration = composition.duration;
                },
              ),
              const SizedBox(
                height: 80.0,
              ),
              Text(
                'Presence-Monitor',
                style: PresenceMonitorTextTheme.kHeadTextStyle.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}