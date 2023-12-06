import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/pages/category/category_page.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/pages/profile/profile_page.dart';

import '../shared/custom_sized_box.dart';
import '../theme/theme_data.dart';
import 'home/home_page.dart';

class PageWithNavigation extends StatelessWidget {

  static const String routeName='/';
  const PageWithNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
                () {
              switch (controller.selectedIndex.value) {
                case 0:
                  return HomeScreen();

                case 1:
                  return CategoryScreen();
                case 2:
                  return ChatScreen();
                  case 3:
                  return ProfileScreen();
                default:
                  return HomeScreen();
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(
              () {
                return Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 12,color: Colors.black.withOpacity(.08))],
                      color: Colors.white,
                      borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15))),
                  child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    ...List.generate(controller.navList.length, (index) {
                      final data =controller.navList[index];
                      return                   GestureDetector(
                        onTap: () {
                          // index=controller.selectedIndex.value;
                          print('Tab tapped: ${index}');

                            controller.changeTabIndex(index);

                        },
                          child: navWidget( title: data['title'],icon: data['icon'],isSelected:/*data['index']==index?!data['isSelected']:*/data['isSelected'],));

                    })
            ],),
                );
              }
            ),
          ),
        ],
      ),
    );;
  }
}
class navWidget extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String title;
  final bool isChat;
  const navWidget({
    super.key,  this.isSelected=false, required this.icon, required this.title,  this.isChat=false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color:isSelected? Color(0xffF0F4F5):Colors.transparent),
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        child: Row(children: [Image.asset(icon,color:isSelected?AppColors.kPrimaryColor: Colors.black,height: 16,width: 16,),CustomSizedBox.space4W,Row(
          children: [
            Text(title,style: AppTheme.textStyleSemiBoldBlack10,),isChat?Text('(0)',style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 10, fontWeight: FontWeight.w600),):SizedBox.shrink(),
          ],
        )],),),
    );
  }
}
