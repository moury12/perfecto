
import 'package:get/get.dart';
import 'package:perfecto/pages/offer/controller/offer_controller.dart';

class OfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OfferController>(OfferController(), );
  }
}