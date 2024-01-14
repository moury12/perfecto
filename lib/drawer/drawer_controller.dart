import 'package:get/get.dart';

class CustomDrawerController extends  GetxController{
  static CustomDrawerController get to => Get.find();
  List<String> subCategory=['Face','Eyes','Lips','Nails','Tools & Brushes','Top Brands'];
  List<String> childCategory=['Foundation','Primer','Contor','Blush','Primer','Settings spray'];
  RxBool isExpanded = false.obs;
  RxBool isExpanded2 = false.obs;
}