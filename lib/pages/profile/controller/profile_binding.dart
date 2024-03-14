import 'package:get/get.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/my-orders/controller/address_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(
      ProfileController(),
    );

    Get.put<ProductDetailsController>(
      ProductDetailsController(),
    );
  }
}

// class AddressBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<AddressController>(AddressController(), permanent: true);
//   }
// }
