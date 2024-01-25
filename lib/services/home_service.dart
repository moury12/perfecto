import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/models/blog_model.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/models/terms_condition_model.dart';

class HomeService {
  static Future<List<BlogModel>> blogCall() async {
    List<BlogModel> blogList = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}blogs', httpMethod: HttpMethod.get);
    globalLogger.d(response, "blog route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        blogList.add(BlogModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return blogList;
  }
  static Future<List<BrandModel>> brandCall() async {
    List<BrandModel> brandList = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}brand', httpMethod: HttpMethod.get);
    globalLogger.d(response, "brand route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        brandList.add(BrandModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return brandList;
  }
  static Future<List<CategoryModel>> categoryCall() async {
    List<CategoryModel> categoryList = [];
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}category', httpMethod: HttpMethod.get);
    globalLogger.d(response, "category route");
    if (response['status'] != null && response['status']) {
      response['data'].forEach((dis) {
        categoryList.add(CategoryModel.fromJson(dis));
      });
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return categoryList;
  }

  static Future<SingleBlogModel> singleBlogCall(String? blogId) async {
    SingleBlogModel singleBlog = SingleBlogModel();

    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}blogs/$blogId',
        httpMethod: HttpMethod.get);
    globalLogger.d(response, "Single blog route");
    if (response['status'] != null && response['status']) {
      singleBlog = SingleBlogModel.fromJson(response['data']);
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return singleBlog;
  }

  // static Future<List<BlogCommentModel>> blogCommentCall() async {
  //   List<BlogCommentModel> blogComentList = [];
  //   final response = await ServiceAPI.genericCall(
  //       url: '${ServiceAPI.apiUrl}blogs/1/get-comment',
  //       httpMethod: HttpMethod.get);
  //   globalLogger.d(response, "blog route");
  //   if (response['status'] != null && response['status']) {
  //     response['data'].forEach((dis) {
  //       blogComentList.add(BlogCommentModel.fromJson(dis));
  //     });
  //   } else if (response['status'] != null && !response['status']) {
  //     ServiceAPI.showAlert(response['message']);
  //   }
  //   return blogComentList;
  // }

  static Future<bool> addBlogComment(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}blogs/add-comment',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        isLoadingEnable: true);
    globalLogger.d(response, "blog comment Route");
    if (response['status'] != null && response['status']) {
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
  static Future<TermsConditionModel> termsConditionCall() async{
    TermsConditionModel termsModel = TermsConditionModel();
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}termcondition', httpMethod: HttpMethod.get);
    globalLogger.d(response, "TermsCondition route");
    if (response['status'] != null && response['status']) {
      termsModel = TermsConditionModel.fromJson(response['data']);
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return termsModel;
  }

}
