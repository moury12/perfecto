import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';

class OfferController extends GetxController {
  static OfferController get to => Get.find();
  RxBool tapped = false.obs;
  Rx<TextEditingController> outletController = TextEditingController().obs;
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
}
