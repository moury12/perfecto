import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';
import 'package:perfecto/pages/page_with_navigation.dart';

class ChildNavScreen extends StatelessWidget {
  static const String routeName = '/main_home_page';
  const ChildNavScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final NavigationController controller = NavigationController.to;
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: AppColors.kBackgroundColor,
      // drawer: const CustomDrawer(),
      body: WillPopScope(
        onWillPop: () async {
          // if (controller.selectedIndex.value == 0) {
          //   if (scaffoldKey.currentState!.isDrawerOpen) {
          //     scaffoldKey.currentState!.closeDrawer();
          //     return false;
          //   }
          //   openDialog(context);
          // } else {
          //   if (scaffoldKey.currentState!.isDrawerOpen) {
          //     scaffoldKey.currentState!.closeDrawer();
          //     return false;
          //   }
          //   controller.selectedIndex.value = 0;
          // }
          // return Future.value(false);
          return Future.value(true);
        },
        child: child,
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(.08))],
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(controller.navList.length, (index) {
                final data = controller.navList[index];
                return GestureDetector(
                    onTap: () {
                      // index=controller.selectedIndex.value;
                      print('Tab tapped: ${index}');

                      controller.changeTabIndex(index);
                      if ((AuthController.to.isLoggedIn.value && (index == 2 || index == 3)) || index == 0 || index == 1) {
                        Get.offAllNamed(MainHomeScreen.routeName);
                      }
                    },
                    child: NavWidget(
                      title: data['title'] + (index == 2 && ChatController.to.msgCount.value > 0 ? '(${ChatController.to.msgCount.value})' : ''),
                      icon: data['icon'],
                      // isSelected: controller.selectedIndex.value == index,
                    ));
              })
            ],
          ),
        );
      }),
    );
  }
}
