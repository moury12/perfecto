import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/services/product_services.dart';

import '../../models/product_model.dart';
import '../../utils.dart';

class ProductDetailsController extends GetxController with GetTickerProviderStateMixin {
  static ProductDetailsController get to => Get.find();
  TabController? tabController;
  TabController? tabController2;
  RxString selectedVariation = ''.obs;
  RxBool isFavourite = false.obs;
  RxBool isAvaiableShade = true.obs;
  RxBool isHelpfull = false.obs;
  RxBool readMore = false.obs;
  RxInt rating = 0.obs;
  RxList imageList = [].obs;
  RxString captureImage = ''.obs;

  final RxList reviewFilterList = [
    {'title': 'With Image', 'is_selected': false, 'key': 'with_image'},
    {'title': '5 Star', 'is_selected': false, 'key': '5'},
    {'title': '4 Star', 'is_selected': false, 'key': '4'},
    {'title': '3 Star', 'is_selected': false, 'key': '3'},
    {'title': '2 Star', 'is_selected': false, 'key': '2'},
    {'title': '1 Star', 'is_selected': false, 'key': '1'},
  ].obs;

  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductReviewImages> reviewImages = <ProductReviewImages>[].obs;
  // Reviews List
  RxList<Reviews> allReviews = <Reviews>[].obs;
  Rx<ProductModel> product = ProductModel().obs;
  void selectedImage() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageList.addAll(selectedImages.map((e) => e.path));
    }
  }

  void selectedImageCamera() async {
    final XFile? selectedImages = await ImagePicker().pickImage(source: ImageSource.camera);
    if (selectedImages != null) {
      captureImage.value = selectedImages.path;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: tabTiles2.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  Future<void> getProductDetails(String id, {bool needLoading = true}) async {
    globalLogger.d(id, 'productListWithCategoryCall');
    productList.clear();
    currentPage.value = 0;
    final data = await ProductService.productDetails(id, needLoading: needLoading);
    product.value = data[ProductDetailType.product];
    productList.value = data[ProductDetailType.customerWillView];
    selectedVariation.value = product.value.variationType == 'shade' ? product.value.shadeId![0] : product.value.sizeId![0];
    globalLogger.d(productList, 'productList');
  }

  Future<void> getReviewImages(String id) async {
    reviewImages.clear();
    final data = await ProductService.productReviewImages(id);
    reviewImages.value = data;
  }

  //storeReviewHelpful
  Future<void> storeReviewHelpful({required String reviewId}) async {
    final body = {'product_review_id': reviewId};
    final data = await ProductService.storeReviewHelpful(body);
    if (data) {
      if (Get.currentRoute == ProductDetailsScreen.routeName) {
        getProductDetails(product.value.id!, needLoading: false);
      } else {
        getAllReviews(needLoading: false);
      }
      showSnackBar(
        msg: 'Helpful Added Successfully',
      );
    }
  }

  // allReviews
  Future<void> getAllReviews({dynamic addition, bool needLoading = true}) async {
    final body = {
      'product_id': product.value.id!,
      'pagination': '15',
      if (AuthController.to.isLoggedIn.value) 'user_id': UserController.to.getUserInfo.id!,
    };
    if (addition != null) {
      body.addAll(addition);
    }
    allReviews.clear();
    final data = await ProductService.productReviews(body, needLoading: needLoading);
    allReviews.value = data;
  }

  double getPrice() {
    if (product.value.variationType == 'shade') {
      return (double.tryParse(product.value.discountPercent!) ?? 0) == 0
          ? double.tryParse(product.value.productShades!.firstWhere((element) => element.shadeId == selectedVariation.value).shadePrice!) ?? 0
          : (double.tryParse(product.value.productShades!.firstWhere((element) => element.shadeId == selectedVariation.value).shadePrice!) ?? 0) -
              ((double.tryParse(product.value.productShades!.firstWhere((element) => element.shadeId == selectedVariation.value).shadePrice!) ?? 0) *
                  (double.tryParse(product.value.discountPercent!) ?? 0) /
                  100);
    } else {
      return (double.tryParse(product.value.discountPercent!) ?? 0) == 0
          ? double.tryParse(product.value.productSizes!.firstWhere((element) => element.sizeId == selectedVariation.value).sizePrice!) ?? 0
          : (double.tryParse(product.value.productSizes!.firstWhere((element) => element.sizeId == selectedVariation.value).sizePrice!) ?? 0) -
              ((double.tryParse(product.value.productSizes!.firstWhere((element) => element.sizeId == selectedVariation.value).sizePrice!) ?? 0) *
                  (double.tryParse(product.value.discountPercent!) ?? 0) /
                  100);
    }
  }

  double getActualPrice() {
    if (product.value.variationType == 'shade') {
      return double.tryParse(product.value.productShades!.firstWhere((element) => element.shadeId == selectedVariation.value).shadePrice!) ?? 0;
    } else {
      return double.tryParse(product.value.productSizes!.firstWhere((element) => element.sizeId == selectedVariation.value).sizePrice!) ?? 0;
    }
  }

  List<String> tabTiles = ['All Shades', 'Bestsellers'];
  List<String> tabTiles2 = ['Description', 'Ingredients', 'How to Use', 'FAQ'];
  RxString displayUrl = ''.obs;
  RxList<String> images = [
    AssetsConstant.megaDeals1,
    AssetsConstant.megaDeals2,
    AssetsConstant.megaDeals3,
    AssetsConstant.megaDeals1,
    AssetsConstant.megaDeals2,
    AssetsConstant.megaDeals3,
  ].obs;
  var currentIndex = 0.obs;
  var currentIndex2 = 0.obs;
  var currentPage = 0.obs;
  List<dynamic> bannerContent = [AssetsConstant.megaDeals2, AssetsConstant.megaDeals1, AssetsConstant.megaDeals3];
}
