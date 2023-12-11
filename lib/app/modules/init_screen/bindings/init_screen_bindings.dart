import 'package:get/get.dart';

import '../controllers/init_screen_controller.dart';

class InitScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitScreenController>(
      () => InitScreenController(),
    );
  }
}