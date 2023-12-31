import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();
  RxBool isbagEmpty = false.obs;
  RxBool iswishListEmpty = false.obs;
  TextEditingController couponController = TextEditingController();
  @override
  void onClose() {
    couponController.dispose();
    super.onClose();
  }
}
