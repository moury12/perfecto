import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/utils.dart';

class AuthService {
  static Future<bool> registerCall(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${ServiceAPI.url}register', httpMethod: HttpMethod.multipartFilePost, noNeedAuthToken: true, allInfoField: body);
    globalLogger.d(response, 'Register');
    if (response['status'] != null && response['status']) {
      return response['message'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<dynamic> loginCall(dynamic body, {required LogInType type}) async {
    final response = await ServiceAPI.genericCall(
      url:
          '${ServiceAPI.apiUrl}${type == LogInType.email ? "login" : type == LogInType.phone ? "otp_login" : type == LogInType.google ? "login/google" : type == LogInType.facebook ? "login/facebook" : type == LogInType.verifyOTP ? "verify_otp" : ''}',
      httpMethod: HttpMethod.multipartFilePost,
      noNeedAuthToken: true,
      isLoadingEnable: true,
      allInfoField: body,
    );
    globalLogger.d(response, "Login Route");
    if (response['status'] != null && response['status']) {
      return response['data'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return {};
  }
}
