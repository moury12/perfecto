import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/services/product_services.dart';

import '../../models/product_model.dart';
import '../../utils.dart';

class ProductDetailsController extends GetxController with GetTickerProviderStateMixin {
  static ProductDetailsController get to => Get.find();
  TabController? tabController;
  TabController? tabController2;
  RxBool isFavourite = false.obs;
  RxBool isAvaiableShade = true.obs;
  RxBool isHelpfull = false.obs;
  RxBool readMore = false.obs;
  RxInt rating = 0.obs;
  RxList imageList = [].obs;
  RxString captureImage = ''.obs;

  RxList<ProductModel> productList = <ProductModel>[].obs;
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

  Future<void> getProductDetails(String id) async {
    globalLogger.d(id, 'productListWithCategoryCall');
    productList.clear();
    final data = await ProductService.productDetails(id);
    product.value = data[ProductDetailType.product];
    productList.value = data[ProductDetailType.customerWillView];
    globalLogger.d(productList, 'productList');
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
