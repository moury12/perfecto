import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';
import 'package:perfecto/services/home_service.dart';

class HomeApiController extends GetxController {
  @override
  void onInit() async {
    categoryListCall();
    await blogListCall();
    await preferenceListCall();
    await formulationListCall();
    await finishListCall();
    await countryListCall();
    await genderListCall();
    await coverageListCall();
    await skinTypeListCall();
    await benefitListCall();
    await concernListCall();
    await ingredientListCall();
    await packSizeListCall();
    await brandListCall();
    await termsConditionCall();

    super.onInit();
  }

  static HomeApiController get to => Get.find();
  RxList<ProductAttributeModel> preferenceList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> formulationList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> finishList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> countryList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> genderList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> coverageList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> benefitList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> concernList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> skinTypeList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> ingredientList = <ProductAttributeModel>[].obs;
  RxList<ProductAttributeModel> packSizeList = <ProductAttributeModel>[].obs;
  RxList<BlogModel> blogList = <BlogModel>[].obs;
  RxList<BrandModel> brandList = <BrandModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  Rx<SingleBlogModel> singleBlog = SingleBlogModel().obs;
  Rx<TermsConditionModel> termsConditionInfo = TermsConditionModel().obs;

  Future<void> termsConditionCall() async {
    termsConditionInfo.value = await HomeService.termsConditionCall();
  }

  Future<void> blogListCall() async {
    blogList.value = await HomeService.blogCall();
  }

  Future<void> preferenceListCall() async {
    preferenceList.value = await HomeService.preferenceCall();
  }

  Future<void> formulationListCall() async {
    formulationList.value = await HomeService.formulationCall();
  }

  Future<void> finishListCall() async {
    finishList.value = await HomeService.finishCall();
  }

  Future<void> countryListCall() async {
    countryList.value = await HomeService.countryCall();
  }

  Future<void> genderListCall() async {
    genderList.value = await HomeService.genderCall();
  }

  Future<void> coverageListCall() async {
    coverageList.value = await HomeService.coverageCall();
  }

  Future<void> skinTypeListCall() async {
    skinTypeList.value = await HomeService.skinTypeCall();
  }

  Future<void> benefitListCall() async {
    benefitList.value = await HomeService.benefitCall();
  }

  Future<void> concernListCall() async {
    concernList.value = await HomeService.concernCall();
  }

  Future<void> ingredientListCall() async {
    ingredientList.value = await HomeService.ingredientCall();
  }

  Future<void> packSizeListCall() async {
    packSizeList.value = await HomeService.packSizeCall();
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
    singleBlog.value = await HomeService.singleBlogCall(blogId);
  globalLogger.d(singleBlog.value.title,'singleBlogList.value.title');
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
