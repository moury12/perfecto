import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList brands = [
    {
      'id': 'A',
      'product': ['Anastasia Beverly Hills', 'Aaranyaa', 'Abena', 'Abelino', 'Aaranyaa']
    },
    {
      'id': 'B',
      'product': ['Anastasia Beverly Hills', 'Aaranyaa', 'Abena', 'Abelino', 'Aaranyaa']
    },
    {
      'id': 'D',
      'product': ['Anastasia Beverly Hills', 'Aaranyaa', 'Abena', 'Abelino', 'Aaranyaa']
    },
    {
      'id': 'C',
      'product': ['Anastasia Beverly Hills', 'Aaranyaa', 'Abena', 'Abelino', 'Aaranyaa']
    },
    {
      'id': 'E',
      'product': ['Anastasia Beverly Hills', 'Aaranyaa', 'Abena', 'Abelino', 'Aaranyaa']
    },
    {
      'id': 'F',
      'product': ['Anastasia Beverly Hills', 'Aaranyaa', 'Abena', 'Abelino', 'Aaranyaa']
    },
  ].obs;
  List<String> generateAlphabets() {
    return List<String>.generate(26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  }

  List<Map<String, dynamic>> megadealsITem = [
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': 245,
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isStacked': false,
      'img': AssetsConstant.megaDeals1
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': 245,
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': false,
      'isBestSeller': false,
      'isStacked': true,
      'img': AssetsConstant.megaDeals2
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': 245,
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isStacked': false,
      'img': AssetsConstant.megaDeals3
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': 245,
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isStacked': false,
      'img': AssetsConstant.megaDeals1
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': 245,
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': false,
      'isBestSeller': true,
      'isStacked': true,
      'img': AssetsConstant.megaDeals2
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': 245,
      'price': '৳550',
      'previousPrice': '৳850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isStacked': false,
      'img': AssetsConstant.megaDeals3
    },
  ];
  List<Map<String, dynamic>> categoryItem = [
    {'name': 'Skin', 'img': AssetsConstant.firstCategory1, 'route': SingleCatergoryWiseScreen.routeName},
    {'name': 'Skin', 'img': AssetsConstant.firstCategory2, 'route': SingleCatergoryWiseScreen.routeName},
    {'name': 'Skin', 'img': AssetsConstant.firstCategory3, 'route': SingleCatergoryWiseScreen.routeName},
    // {'name': 'Skin', 'img': AssetsConstant.firstCategory4, 'route': OutletScreen.routeName},
    // {'name': 'Skin', 'img': AssetsConstant.firstCategory5, 'route': SingleCatergoryWiseScreen.routeName},
    // {'name': 'Skin', 'img': AssetsConstant.firstCategory6, 'route': SingleCatergoryWiseScreen.routeName},
    // {'name': 'Skin', 'img': AssetsConstant.firstCategory7, 'route': SingleCatergoryWiseScreen.routeName},
    // {'name': 'Offers', 'img': AssetsConstant.firstCategory8, 'route': SingleCatergoryWiseScreen.routeName},
  ];
  Rx<PageController> pageController = PageController().obs;
  Rx<int> currentPage = 0.obs;
  List<String> bannerContent = [AssetsConstant.slider1, AssetsConstant.slider2, AssetsConstant.verticalBannner];

  @override
  void onClose() {
    pageController.value.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      try {
        if (NavigationController.to.selectedIndex.value == 0) {
          if (currentPage < (bannerContent.length - 1)) {
            pageController.value.nextPage(duration: Duration(milliseconds: 2000), curve: Curves.ease);
          } else {
            pageController.value.animateToPage(0, duration: Duration(milliseconds: 2000), curve: Curves.ease);
          }
        }
      } catch (e) {
        globalLogger.e(e);
      }
    });
    // TODO: implement onInit
    super.onInit();
  }
}
