import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';

class OfferController extends GetxController{
  static OfferController get to => Get.find();
  RxBool  tapped = false.obs;
  RxList categoryWiseITem = [
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': '245',
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isFeatured': false,
      'isDiscount': true,
      'isFavourite': false,
      'isStacked': false,
      'isOutofStock': false,
      'isOnSale':false,

      'img': AssetsConstant.megaDeals1,
      'buttonText': 'SELECT SHADE'
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': '245',
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': false,
      'isBestSeller': false,
      'isStacked': true,
      'isFeatured': true,
      'isDiscount': true,
      'isFavourite': false,
      'isOutofStock': true,
      'isOnSale':false,
      'img': AssetsConstant.megaDeals2,
      'buttonText': 'OUT OF STOCK'
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': '245',
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isStacked': true,
      'isFeatured': false,
      'isDiscount': false,
      'isFavourite': false,
      'isOutofStock': false,
      'isOnSale':false,

      'img': AssetsConstant.megaDeals3,
      'buttonText': 'SELECT SIZE'
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': '245',
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': true,
      'isBestSeller': true,
      'isFeatured': false,
      'isDiscount': true,
      'isFavourite': false,
      'isOnSale':true,

      'isStacked': true,
      'isOutofStock': false,
      'img': AssetsConstant.megaDeals1,
      'buttonText': 'ADD TO BAG'
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': '245',
      'price': '৳ 1,550',
      'previousPrice': '৳1,850',
      'isbuy1Get1': false,
      'isBestSeller': true,
      'isFeatured': false,
      'isDiscount': true,
      'isFavourite': false,
      'isOnSale':false,

      'isOutofStock': false,
      'isStacked': true,
      'img': AssetsConstant.megaDeals2,
      'buttonText': 'ADD TO BAG'
    },
    {
      'name': 'Maybelline New York Superstay Vi sdfsrgffg',
      'rating': '245',
      'price': '৳550',
      'previousPrice': '৳850',
      'isbuy1Get1': true,
      'isBestSeller': false,
      'isFeatured': false,
      'isDiscount': true,
      'isFavourite': false,
      'isOnSale':true,

      'isOutofStock': false,
      'isStacked': false,
      'img': AssetsConstant.megaDeals3,
      'buttonText': 'ADD TO BAG'
    },
  ].obs;
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