import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/combo_product_model.dart';
import 'package:perfecto/models/coupon_model.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/outlet_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/shade_model.dart';
import 'package:perfecto/models/shipping_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';
import 'package:perfecto/pages/my-cart/cart_controller.dart';
import 'package:perfecto/services/home_service.dart';
import 'package:perfecto/services/product_services.dart';
import 'package:perfecto/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/offer_details_model.dart';
import '../models/product_model.dart';
import '../models/trending_search_model.dart';

class HomeApiController extends GetxController {
  RxString couponCode = ''.obs;
  RxString rewardPointApply = '0'.obs;

  static HomeApiController get to => Get.find();
  RxList<OutletModel> outletList = <OutletModel>[].obs;
  RxList<ProductAttributeModel> colorList = <ProductAttributeModel>[].obs;
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
  Rx<TermsConditionModel> privacyPolicyInfo = TermsConditionModel().obs;
  Rx<TermsConditionModel> returnRefundInfo = TermsConditionModel().obs;

  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> searchList = <ProductModel>[].obs;

  RxList<SizeModel> sizeList = <SizeModel>[].obs;
  RxList<ShadeModel> shadeList = <ShadeModel>[].obs;
  RxList<OfferModel> offerList = <OfferModel>[].obs;
  RxList<TrendingSearchModel> trendingSearchList = <TrendingSearchModel>[].obs;
  RxList<ComboOfferItemModel> comboList = <ComboOfferItemModel>[].obs;
  Rx<ComboDetailsModel> comboProduct = ComboDetailsModel().obs;
  Rx<OfferDetailsModel> offerDetails = OfferDetailsModel().obs;
  Rx<OfferDetailsModel> singleCatOffer = OfferDetailsModel().obs;
  Rx<CouponModel> couponInfo = CouponModel().obs;
  Rx<ShippingModel> shippingInfo = ShippingModel().obs;
  Rx<RewardPointModel> rewardPointInfo = RewardPointModel().obs;

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
    await privacyPolicyCall();
    await returnRefundCall();
    await colorListCall();
    await outletListCall();
    await shadeListCall();
    await sizeListCall();
    trendingSearchListCall();
    rewardPointCall();
    shippingCall();

    NavigationController.to.attributeListCall();

    super.onInit();
  }

  Future<void> privacyPolicyCall() async {
    privacyPolicyInfo.value = await HomeService.privacyPolicyCall();
  }

  Future<void> returnRefundCall() async {
    returnRefundInfo.value = await HomeService.returnRefundCall();
  }

  Future<void> termsConditionCall() async {
    termsConditionInfo.value = await HomeService.termsConditionCall();
  }

  Future<void> blogListCall() async {
    blogList.value = await HomeService.blogCall();
  }

  Future<void> outletListCall() async {
    outletList.value = await HomeService.outletCall();
  }

  Future<void> preferenceListCall() async {
    preferenceList.value = await HomeService.preferenceCall();
  }

  Future<void> colorListCall() async {
    colorList.value = await HomeService.colorCall();
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

  Future<void> sizeListCall() async {
    sizeList.value = await HomeService.sizeCall();
  }

  Future<void> shadeListCall() async {
    shadeList.value = await HomeService.shadeCall();
  }

  //offerCall
  Future<void> offerListCall() async {
    offerList.value = await HomeService.offerCall();
  }

  //offerDetailsCall
  Future<void> offerDetailsCall(String offerId) async {
    final data = await HomeService.offerDetailsCall(offerId);
    offerDetails.value = data[OfferType.offer]!;
    comboList.value = data[OfferType.combo]! as List<ComboOfferItemModel>;
  }

  //offerDetailsCall
  Future<void> offerDetailsCatCall(String offerId, String catId) async {
    singleCatOffer.value = await HomeService.offerDetailsCatCall(offerId, catId);
    productList.value = singleCatOffer.value.data!.first.products!.data!;
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

  Future<void> productListWithCategoryCall(dynamic body) async {
    globalLogger.d(body, 'productListWithCategoryCall');
    productList.clear();
    productList.value = await ProductService.productListCallWithCategory(body);
    globalLogger.d(productList, 'productList');
  }

  Future<void> productListCallWithFilterCall(dynamic body) async {
    globalLogger.d(body, 'productListCallWithFilterCall');
    productList.clear();
    productList.value = await ProductService.productListCallWithFilter(body);
    globalLogger.d(productList, 'productList');
  }

  Future<void> productListCallWithNameCall(dynamic body) async {
    globalLogger.d(body, 'productListCallWithNameCall');
    productList.clear();
    productList.value = await ProductService.productListCallWithName(body);
    searchList.value = productList;
    globalLogger.d(productList, 'productList');
  }

  //trendingSearchList
  Future<void> trendingSearchListCall() async {
    trendingSearchList.value = await ProductService.trendingSearchList();
  }

  Future<void> singleBlogListCall(String? blogId) async {
    singleBlog.value = await HomeService.singleBlogCall(blogId);
    globalLogger.d(singleBlog.value.title, 'singleBlogList.value.title');
  }

  Future<bool> addCouponCode(String coupon) async {
    couponInfo.value = await HomeService.addCouponCode({'coupon_code': coupon});
    if (couponInfo.value.couponCode != null) {
      if (UserController.to.cartTotalPrice() - UserController.to.cartTotalDiscountPrice() < couponInfo.value.minimumExpenses!.toDouble()) {
        showSnackBar(msg: 'Minimum order amount should be ${couponInfo.value.minimumExpenses} to apply this coupon.');
        return false;
      }
      changeRewardPointApply();

      couponCode.value = coupon;
      CartController.to.couponController.text = '';
      showSnackBar(
        msg: 'Coupon Added successfully.',
      );
      Get.back();
      // afterLogin(isCreated);
    }
    return couponInfo.value.couponCode != null;
  }

  changeRewardPointApply() {
    if (rewardPointApply.value != '0') {
      if ((rewardPointApply.value.toInt() /
              HomeApiController.to.rewardPointInfo.value.rewardPoint!.toInt() *
              HomeApiController.to.rewardPointInfo.value.rewardPointValue!.toInt()) >
          (UserController.to.cartTotalPrice() - UserController.to.cartTotalDiscountPrice() - (couponInfo.value.amount ?? '0').toDouble())) {
        final tk = UserController.to.cartTotalPrice() - UserController.to.cartTotalDiscountPrice() - (couponInfo.value.amount ?? '0').toDouble();
        rewardPointApply.value = ((tk / HomeApiController.to.rewardPointInfo.value.rewardPointValue!.toInt()) * HomeApiController.to.rewardPointInfo.value.rewardPoint!.toInt())
            .floor()
            .toStringAsFixed(0);
      }
    }
  }

  //check reward point apply or not and reward point exceed to total price or not
  Future<void> checkRewardPointApply(String rewardPoint) async {
    if (rewardPoint.isNotEmpty) {
      if (rewardPoint.toInt() > UserController.to.getUserInfo.rewardPoints!.toInt()) {
        showSnackBar(msg: 'You have only ${UserController.to.getUserInfo.rewardPoints} reward points!');
        return;
      }
      rewardPointApply.value = rewardPoint;
      CartController.to.couponController.text = '';
      showSnackBar(
        msg: 'Reward Point Added successfully.',
      );
      Get.back();
    }
  }

  //rewardPointCall
  Future<void> rewardPointCall() async {
    rewardPointInfo.value = await HomeService.rewardPointCall();
  }

  //shippingCall
  Future<void> shippingCall() async {
    shippingInfo.value = await HomeService.shippingCall();
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

  void openMap(double lat, double long) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
