import 'package:get/get.dart';

class CustomDrawerController extends  GetxController{
  static CustomDrawerController get to => Get.find();
  List<String> subCategory=['Face','Eyes','Lips','Nails','Tools & Brushes','Top Brands'];
  RxBool isExpanded = false.obs;
}