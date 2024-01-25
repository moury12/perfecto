import 'package:get/get.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';
import 'package:perfecto/services/home_service.dart';

class HomeApiController extends GetxController {
  @override
  void onInit() async {
    await blogListCall();
    await categoryListCall();
    await brandListCall();
    await termsConditionCall();

    super.onInit();
  }

  static HomeApiController get to => Get.find();
  RxList<BlogModel> blogList = <BlogModel>[].obs;
  RxList<BrandModel> brandList = <BrandModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  Rx<SingleBlogModel> singleBlogList = SingleBlogModel().obs;
  Rx<TermsConditionModel> termsConditionInfo = TermsConditionModel().obs;
  Future<void> termsConditionCall() async {
    termsConditionInfo.value = await HomeService.termsConditionCall();
  }

  Future<void> blogListCall() async {
    blogList.value = await HomeService.blogCall();
  }

  Future<void> brandListCall() async {
    final List<BrandModel> data = await HomeService.brandCall();
    data.sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

    _addSuspensionTag(data);

    brandList.value = data;
  }

  Future<void> categoryListCall() async {
    categoryList.value = await HomeService.categoryCall();
  }

  Future<void> singleBlogListCall(String? blogId) async {
    singleBlogList.value = await HomeService.singleBlogCall(blogId);
  }
  void _addSuspensionTag(List<BrandModel> list) {
    String? tag;
    for (var i = 0; i < list.length; i++) {
      final currentTag = list[i].name!.substring(0, 1).toUpperCase();
      if (tag != currentTag) {
        tag = currentTag;
        list[i].susTag = tag;
      }
    }
  }
}

