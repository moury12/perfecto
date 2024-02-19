import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
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
          productList.add(ProductModel.fromJson(dis));
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

  static Future<Map<ProductDetailType, dynamic>> productDetails(String id) async {
    try {
      ProductModel productModel = ProductModel();
      List<ProductModel> productList = [];
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}product-detail/$id',
        httpMethod: HttpMethod.get,
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
}
