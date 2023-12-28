import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/category/category_page.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/pages/profile/profile_page.dart';

import '../shared/custom_sized_box.dart';
import '../theme/theme_data.dart';
import 'home/home_page.dart';

class MainHomeScreen extends StatelessWidget {
  static const String routeName = '/main_home_page';
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.to;
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      drawer: CustomDrawer(),
      body: Obx(
        () {
          switch (controller.selectedIndex.value) {
            case 0:
              return const HomeScreen();
            case 1:
              return const CategoryScreen();
            case 2:
              return const ChatScreen();
            case 3:
              return const ProfileScreen();
            default:
              return const HomeScreen();
          }
        },
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
    },
    child: NavWidget(
    title: data['title'] + (index == 2 ? '(0)' : ''),
    icon: data['icon'],
    isSelected: controller.selectedIndex.value == index,
    ));
    })
    ],
    ),
    );
    }),
    );
  }
}

class NavWidget extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String title;
  final bool isChat;
  const NavWidget({
    super.key,
    this.isSelected = false,
    required this.icon,
    required this.title,
    this.isChat = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: isSelected ? const Color(0xffF0F4F5) : Colors.transparent),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            Image.asset(
              icon,
              color: isSelected ? AppColors.kPrimaryColor : Colors.black,
              height: 16,
              width: 16,
            ),
            CustomSizedBox.space4W,
            Row(
              children: [
                Text(
                  title,
                  style: AppTheme.textStyleSemiBoldBlack10,
                ),
                isChat
                    ? const Text(
                        '(0)',
                        style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 10, fontWeight: FontWeight.w600),
                      )
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PageWithNavigation extends StatelessWidget {
  const PageWithNavigation({super.key, required this.scaffoldChild});
  final Widget scaffoldChild;

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.to;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(height: size.height, width: size.width, child: scaffoldChild),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height - 70,
          child: Obx(() {
            return Material(
              child: Container(
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

                            if (Get.currentRoute != MainHomeScreen.routeName) {
                              Get.offAllNamed(MainHomeScreen.routeName);
                            }
                          },
                          child: NavWidget(
                            title: data['title'] + (index == 2 ? '(0)' : ''),
                            icon: data['icon'],
                            isSelected: controller.selectedIndex.value == index,
                          ));
                    })
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
