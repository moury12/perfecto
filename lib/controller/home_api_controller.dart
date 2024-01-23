import 'package:get/get.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';
import 'package:perfecto/services/home_service.dart';

class HomeApiController extends GetxController{
  @override
  void onInit() async {
    await blogListCall();
    await termsConditionCall();
    super.onInit();
  }
  static HomeApiController get to => Get.find();
  RxList<BlogModel> blogList = <BlogModel>[].obs;
  Rx<TermsConditionModel> termsConditionInfo = TermsConditionModel().obs;
  Future<void> termsConditionCall() async {
    termsConditionInfo.value = await HomeService.termsConditionCall();

  }
  Future<void> blogListCall() async{
    blogList.value= await HomeService.blogCall();
  }
}