import 'package:get/get.dart';

import 'package:PresenceMonitor/app/modules/home/bindings/home_bindings.dart';
import 'package:PresenceMonitor/app/modules/home/views/home_view.dart';
import 'package:PresenceMonitor/app/modules/init_screen/bindings/init_screen_bindings.dart';
import 'package:PresenceMonitor/app/modules/init_screen/views/init_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INIT_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INIT_SCREEN,
      page: () => const InitScreenView(),
      binding: InitScreenBinding(),
    ),
  ];
}