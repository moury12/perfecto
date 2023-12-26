import 'package:get/get.dart';

class CheckOutController extends GetxController{
  static CheckOutController get to => Get.find();
  RxBool checked =false.obs;
  RxBool checked2 =false.obs;
  RxBool checked3 =false.obs;
  RxBool isonlinePay =false.obs;
  RxBool isCash =false.obs;

}