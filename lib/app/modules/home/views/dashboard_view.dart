import 'package:PresenceMonitor/app/global_widgets/card_pc.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:PresenceMonitor/app/global_widgets/user_avatar.dart';
import 'package:PresenceMonitor/app/modules/home/controllers/home_controller.dart';
import 'package:PresenceMonitor/app/theme/text_theme.dart';

class DashboardView extends GetView<HomeController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.067),
          height: size.height + 350,
          width: size.width,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.10),
            GetBuilder<HomeController>(
              id: 7,
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Bem vindo\nde volta, ${controller.userName}',
                      style: PresenceMonitorTextTheme.kSubHeadTextStyle
                          .copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                    GestureDetector(
                      // onTap: () => Get.to(() => ProfileView()),
                      child: UserAvatar(
                        ismale: controller.isMale,
                        radius: size.width * 0.075,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            Obx(
              () => controller.updateCard
                ? Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0),
                      itemCount: controller.workStations.length,
                      itemBuilder: (context, index) {
                        return CardPC(
                          studentName: controller.workStations[index]
                              .student
                              .name,
                          studentRegistration:
                              controller.workStations[index]
                                  .student
                                  .registration,
                          type: controller.workStations[index].type,
                          publishedAt: controller.workStations[index].updatedAt,
                          pcName: controller.workStations[index].name,
                          pcStatus: controller.workStations[index].status,
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0),
                      itemCount: controller.workStations.length,
                      itemBuilder: (context, index) {
                        return CardPC(
                          studentName: controller.workStations[index]
                              .student
                              .name,
                          studentRegistration:
                              controller.workStations[index]
                                  .student
                                  .registration,
                          type: controller.workStations[index].type,
                          publishedAt: controller.workStations[index].updatedAt,
                          pcName: controller.workStations[index].name,
                          pcStatus: controller.workStations[index].status,
                        );
                      },
                    ),
                  ),
            ),
            // GetBuilder<HomeController>(
            //   init: HomeController(),
            //   id: 1,
            //   builder: (_) {
            //      return ListView.separated(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       separatorBuilder: (context, index) => const SizedBox(height: 16.0),
            //       itemCount: controller.workStations.length,
            //       itemBuilder: (context, index) {
            //         return CardPC(
            //           studentName: controller.workStations[index].student.name,
            //           studentRegistration: controller.workStations[index].student.registration,
            //           type: controller.workStations[index].type,
            //           publishedAt: DateTime(2023, 12, 8, 12, 14, 36),
            //           pcName: controller.workStations[index].name,
            //           pcStatus: controller.workStations[index].status,
            //         );
            //       },
            //     );
            //   },
            // )
          ],
        ),
      )
    );
  }
}