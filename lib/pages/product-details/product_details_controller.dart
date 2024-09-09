import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/combo_product_model.dart';
import 'package:perfecto/models/combo_product_model.dart';
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
  RxList<String> imageList = <String>[].obs;
  Rx<TextEditingController> reviewTitleController = TextEditingController().obs;
  Rx<TextEditingController> reviewCommentController = TextEditingController().obs;

  Rx<GlobalKey> ratingKey = GlobalKey().obs;

  Future<void> scrollToInstructorRating() async {
    globalLogger.d('Scrolling to Instructor Rating');
    globalLogger.d(ratingKey.value.currentState);
    final context = ratingKey.value.currentContext!;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
    );
  }

  RxString captureImage = ''.obs;

  RxInt selectedImageForPage = 0.obs;

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
  Rx<ComboDetailsModel> comboDetails = ComboDetailsModel().obs;
  void selectedImage() async {
    final selectedImages = await ImagePicker().pickMultiImage(imageQuality: 25);
    if (selectedImages.isNotEmpty) {
      imageList.addAll(selectedImages.map((e) => e.path));
    }
  }

  void selectedImageCamera() async {
    final selectedImages = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);
    if (selectedImages != null) {
      imageList.add(selectedImages.path);
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
    productList.clear();
    currentPage.value = 0;
    final data = await ProductService.productDetails(id, needLoading: needLoading);
    product.value = data[ProductDetailType.product];
    productList.value = data[ProductDetailType.customerWillView];
    try {
      product.value.productShades?.sort((a, b) => b.stock!.toInt().compareTo(a.stock!.toInt()));
    } catch (e) {
      globalLogger.e(e);
    }
    selectedVariation.value = getSelectedVariant();
    rating.value = product.value.myReview != null ? product.value.myReview!.star!.toInt() : 0;
    reviewTitleController.value.text = product.value.myReview != null ? product.value.myReview!.title! : '';
    reviewCommentController.value.text = product.value.myReview != null ? product.value.myReview!.comment! : '';
  }

  getSelectedVariant() {
    if (product.value.variationType == 'shade') {
      return product.value.productShades!.firstWhereOrNull((element) => element.stock != '0')?.shadeId ?? product.value.shadeId![0];
    } else {
      return product.value.productSizes!.firstWhereOrNull((element) => element.stock != '0')?.sizeId ?? product.value.sizeId![0];
    }
  }

  Future<void> getComboDetails(String id, {bool needLoading = true}) async {
    final data = await ProductService.comboDetails(id, needLoading: needLoading);
    comboDetails.value = data;
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

  //post review
  Future<void> postReview(
      /*{required String comment, required String rating, required String title, required String productId, String? shadeId, String? sizeId, required String orderId}*/) async {
    final body = {
      "product_id": product.value.id!,
      "order_id": product.value.orderId!,
      "title": reviewTitleController.value.text,
      "comment": reviewCommentController.value.text,
      "star": rating.toString(),
    }; /*{
      'product_id': productId,
      if (shadeId != null) 'shade_id': shadeId,
      if (sizeId != null) 'size_id': sizeId,
      'order_id': orderId,
      'title': title,
      'comment': comment,
      'star': rating,
    };*/
    final List<Map<String, dynamic>> images = [];
    if (imageList.isNotEmpty) {
      imageList.forEach((element) {
        images.add({
          "key": "images[]",
          "value": element,
        });
      });
    }
    globalLogger.d(body);

    final data = await ProductService.postReview(body, images);
    if (data) {
      // if (Get.currentRoute == ProductDetailsScreen.routeName) {
      //   getProductDetails(product.value.id!, needLoading: false);
      // } else {
      //   getAllReviews(needLoading: false);
      // }
      showSnackBar(
        msg: 'Review Added Successfully. Waiting for Admin Approval.',
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
      return double.tryParse(product.value.productShades!.firstWhereOrNull((element) => element.shadeId == selectedVariation.value)?.discountedPrice ?? '0') ?? 0;
    } else {
      return double.tryParse(product.value.productSizes!.firstWhereOrNull((element) => element.sizeId == selectedVariation.value)?.discountedPrice ?? '0') ?? 0;
    }
  }

  double discountPercent() {
    if (product.value.variationType == 'shade') {
      return double.tryParse(product.value.productShades!.firstWhereOrNull((element) => element.shadeId == selectedVariation.value)?.discountPercent ?? '0') ?? 0;
    } else {
      return double.tryParse(product.value.productSizes!.firstWhereOrNull((element) => element.sizeId == selectedVariation.value)?.discountPercent ?? '0') ?? 0;
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
