import 'package:get/get.dart';

import '../../../constants/assets_constants.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();
  RxBool tapped = false.obs;
}
