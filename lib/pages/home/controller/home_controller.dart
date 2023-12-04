import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
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
  List<Map<String, dynamic>> productItem = [
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory1,
    },
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory2,
    },
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory3,
    },
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory4,
    },
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory5,
    },
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory6,
    },
    {
      'name': 'Skin',
      'img': AssetsConstant.firstCategory7,
    },
    {
      'name': 'Offers',
      'img': AssetsConstant.firstCategory8,
    },
  ];

  TextEditingController searchController = TextEditingController();
  Rx<PageController> pageController = PageController().obs;
  Rx<int> currentPage = 0.obs;
  List<String> bannerContent = [
    AssetsConstant.slider1,
    /* AssetsConstant.slider2,*/
    AssetsConstant.verticalBannner
  ];
  @override
  void onClose() {
    searchController.dispose();
    pageController.value.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    Timer.periodic(Duration(milliseconds: 800), (timer) {
      if (currentPage < (bannerContent.length - 1)) {
        pageController.value.nextPage(
            duration: Duration(milliseconds: 800), curve: Curves.ease);
      } else {
        pageController.value.animateToPage(0,
            duration: Duration(milliseconds: 1000), curve: Curves.ease);
      }
    });
    // TODO: implement onInit
    super.onInit();
  }
}
