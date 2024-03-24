import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/combo_product_model.dart';
import 'package:perfecto/models/product_model.dart';
import 'package:perfecto/models/trending_search_model.dart';

import '../models/product_attribute_model.dart';
import '../utils.dart';

class ProductService {
  static Future<List<ProductModel>> productListCallWithCategory(dynamic body, {String? paginationUrl}) async {
    try {
      List<ProductModel> productList = [];
      final response = await ServiceAPI.genericCall(
        url: paginationUrl ?? '${Service.apiUrl}products-cat',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        // defaultErrorMsgShow: false,
      );
      globalLogger.d(response, "Category Product Route");
      if (response['status'] != null && response['status']) {
        response['data']['products']['data'].forEach((dis) {
          try {
            productList.add(ProductModel.fromJson(dis));
          } catch (e) {
            globalLogger.e("Error occurred in Call: $dis");
            globalLogger.e("Error occurred in Call: $e");
          }
        });
        if (response['data']['products']['next_page_url'] != null) {
          HomeApiController.to.paginationUrl.value = response['data']['products']['next_page_url'];
        } else {
          HomeApiController.to.paginationUrl.value = '';
        }
        try {
          NavigationController.to.attributeList.firstWhere((element) => element.keyName == 'average_rating').attributes = response['data']['starCounts'] != null
              ? (response['data']['starCounts'] as Map)
                  .entries
                  .map((e) => ProductAttributeModel(
                      id: e.key.toString().substring(0, 1),
                      name: e.key.toString(),
                      productsCount: e.value.toString(),
                      filtered: body['average_rating'] == e.key.toString().substring(0, 1)))
                  .toList()
              : [];
        } catch (e) {
          globalLogger.e("Error occurred in Call: $e");
        }
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return productList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductModel>> productListCallWithFilter(dynamic body, {String? paginationUrl}) async {
    try {
      List<ProductModel> productList = [];
      final response = await ServiceAPI.genericCall(
        url: paginationUrl ?? '${Service.apiUrl}products',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        // defaultErrorMsgShow: false,
      );
      globalLogger.d(response, "Filter Product Route");
      if (response['status'] != null && response['status']) {
        response['data']['products']['data'].forEach((dis) {
          try {
            productList.add(ProductModel.fromJson(dis));
          } catch (e) {
            globalLogger.e("Error occurred in Call: $dis");
            globalLogger.e("Error occurred in Call: $e");
          }
        });

        if (response['data']['products']['next_page_url'] != null) {
          HomeApiController.to.paginationUrl.value = response['data']['products']['next_page_url'];
        } else {
          HomeApiController.to.paginationUrl.value = '';
        }
        try {
          NavigationController.to.attributeList.firstWhere((element) => element.keyName == 'average_rating').attributes = (response['data']['starCounts'] != null
              ? (response['data']['starCounts'] as Map)
                  .entries
                  .map((e) => ProductAttributeModel(
                      id: e.key.toString().substring(0, 1),
                      name: e.key.toString(),
                      productsCount: e.value.toString(),
                      filtered: body['average_rating'] == e.key.toString().substring(0, 1)))
                  .toList()
              : []);
        } catch (e) {
          globalLogger.e("Error occurred in Call: $e");
          // Return an empty list or handle the error accordingly
        }
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return productList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //TrendingSearchModel list
  static Future<List<TrendingSearchModel>> trendingSearchList() async {
    try {
      List<TrendingSearchModel> trendingSearchList = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}trending-search',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: {'pagination': '5'},
      );
      globalLogger.d(response, "Trending Search Route");
      if (response['status'] != null && response['status']) {
        response['data']['data'].forEach((dis) {
          try {
            trendingSearchList.add(TrendingSearchModel.fromJson(dis));
          } catch (e) {
            globalLogger.e("Error occurred in Call: $e");
          }
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return trendingSearchList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<List<ProductModel>> productListCallWithName(dynamic body, {String? paginationUrl}) async {
    try {
      List<ProductModel> productList = [];
      final response = await ServiceAPI.genericCall(
        url: paginationUrl ?? '${Service.apiUrl}products-name',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        // defaultErrorMsgShow: false,
      );
      globalLogger.d(response, "Filter Product Route");
      if (response['status'] != null && response['status']) {
        response['data']['products']['data'].forEach((dis) {
          try {
            productList.add(ProductModel.fromJson(dis));
          } catch (e) {
            globalLogger.e("Error occurred in Call: $dis");
            globalLogger.e("Error occurred in Call: $e");
          }
        });

        if (response['data']['products']['next_page_url'] != null) {
          HomeApiController.to.paginationUrl.value = response['data']['products']['next_page_url'];
        } else {
          HomeApiController.to.paginationUrl.value = '';
        }
        try {
          NavigationController.to.attributeList.firstWhere((element) => element.keyName == 'average_rating').attributes = response['data']['starCounts'] != null
              ? (response['data']['starCounts'] as Map)
                  .entries
                  .map((e) => ProductAttributeModel(
                      id: e.key.toString().substring(0, 1),
                      name: e.key.toString(),
                      productsCount: e.value.toString(),
                      filtered: body['average_rating'] == e.key.toString().substring(0, 1)))
                  .toList()
              : [];
        } catch (e) {
          globalLogger.e("Error occurred in Call: $e");
        }
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return productList;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  static Future<Map<ProductDetailType, dynamic>> productDetails(String id, {required bool needLoading}) async {
    try {
      ProductModel productModel = ProductModel();
      List<ProductModel> productList = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}product-detail/$id',
        httpMethod: HttpMethod.multipartFilePost,
        isLoadingEnable: needLoading,
        allInfoField: AuthController.to.isLoggedIn.value ? {'user_id': UserController.to.getUserInfo.id!} : {},
      );
      globalLogger.d(response, "Category Product Route");
      if (response['status'] != null && response['status']) {
        productModel = ProductModel.fromJson(response['data']['product']);
        response['data']['customer_also_viewed'].forEach((product) {
          productList.add(ProductModel.fromJson(product));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return {
        ProductDetailType.product: productModel,
        ProductDetailType.customerWillView: productList,
      };
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return {}; // Return an empty list or handle the error accordingly
    }
  }

  //comboDetails data
  static Future<ComboDetailsModel> comboDetails(String id, {required bool needLoading}) async {
    try {
      ComboDetailsModel comboModel = ComboDetailsModel();
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}combo-product-detail/$id',
        httpMethod: HttpMethod.get,
        isLoadingEnable: needLoading,
      );
      globalLogger.d(response, "Combo Product Route");
      if (response['status'] != null && response['status']) {
        comboModel = ComboDetailsModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return comboModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return ComboDetailsModel(); // Return an empty list or handle the error accordingly
    }
  }

  // store-review-helpful
  static Future<bool> storeReviewHelpful(dynamic body) async {
    try {
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}store-review-helpful',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
      );
      globalLogger.d(response, "Review Helpful Route");
      if (response['status'] != null && response['status']) {
        return true;
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return false;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");

      return false; // Return an empty list or handle the error accordingly
    }
  }

  //post-review
  static Future<bool> postReview(dynamic body, List<Map<String, dynamic>>? images) async {
    globalLogger.d(images, "Post Review Route");
    try {
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}product-review',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        imageListWithKeyValue: images,
      );
      globalLogger.d(response, "Post Review Route");
      if (response['status'] != null && response['status']) {
        return true;
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return false;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return false; // Return an empty list or handle the error accordingly
    }
  }

  //productReviewImages
  static Future<List<ProductReviewImages>> productReviewImages(String id) async {
    try {
      List<ProductReviewImages> reviewImages = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}get-review-all-images',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: {'product_id': id},
      );
      globalLogger.d(response, "Review Images Route");
      if (response['status'] != null && response['status']) {
        response['data'].forEach((image) {
          reviewImages.add(ProductReviewImages.fromJson(image));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return reviewImages;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }

  //productReviews
  static Future<List<Reviews>> productReviews(dynamic body, {required bool needLoading}) async {
    try {
      List<Reviews> allReviews = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}get-review-product-wise',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: needLoading,
        loadingMessage: 'Loading...',
      );
      globalLogger.d(response, "reviews Route");
      if (response['status'] != null && response['status']) {
        response['data']['data'].forEach((review) {
          allReviews.add(Reviews.fromJson(review));
        });
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return allReviews;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }
}
