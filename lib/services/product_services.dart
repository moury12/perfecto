import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/product_model.dart';

import '../utils.dart';

class ProductService {
  static Future<List<ProductModel>> productListCallWithCategory(dynamic body) async {
    try {
      List<ProductModel> productList = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}products-cat',
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
    try {
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}post-review',
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
