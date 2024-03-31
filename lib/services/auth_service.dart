import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/pages/auth/login_page.dart';
import 'package:perfecto/utils.dart';

class AuthService {
  static Future<bool> registerCall(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}register', httpMethod: HttpMethod.multipartFilePost, noNeedAuthToken: true, allInfoField: body);
    globalLogger.d(response, error: 'Register');
    if (response['status'] != null && response['status']) {
      showSnackBar(
        msg: response['message'],
      );
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['data']);
    }
    return false;
  }

  static Future<dynamic> forgetPassword(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}forgot_password',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        noNeedAuthToken: true,
        loadingMessage: 'Use OTP to Change Password.');
    globalLogger.d(response, error: 'Forget password');
    if (response['status'] != null && response['status']) {
      return response['data'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return {};
  }

  static Future<dynamic> verifyEmail(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}verify_email',
        httpMethod: HttpMethod.multipartFilePost,
        noNeedAuthToken: true,
        // isLoadingEnable: true,

        allInfoField: body);
    globalLogger.d(response, error: "Verify Email Route");

    if (response['status'] != null && response['status']) {
      return response['data'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['data']);
    }
    return {};
  }

  static Future<bool> changePassword(dynamic body) async {
    final response = await ServiceAPI.genericCall(url: '${Service.apiUrl}change_password', httpMethod: HttpMethod.multipartFilePost, noNeedAuthToken: false, allInfoField: body);
    globalLogger.d(response, error: "change password");

    if (response['status'] != null && response['status']) {
      showSnackBar(msg: response['message']);
      return true;
    } else if (response['status'] != null && !response['status']) {
      Get.back();
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }

  static Future<dynamic> loginCall(dynamic body, {required LogInType type}) async {
    final response = await ServiceAPI.genericCall(
      url:
          '${Service.apiUrl}${type == LogInType.email ? "login" : type == LogInType.phone ? "otp_login" : type == LogInType.google ? "login/google" : type == LogInType.facebook ? "login/facebook" : type == LogInType.verifyOTP ? "verify_otp" : ''}',
      httpMethod: HttpMethod.multipartFilePost,
      noNeedAuthToken: true,
      isLoadingEnable: type == LogInType.phone ? false : true,
      allInfoField: body,
      debugEnable: true,
    );
    globalLogger.d(response, error: "Login Route");
    if (response['status'] != null && response['status']) {
      return response['data'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['data']);
    }
    return {};
  }

  static Future<bool> logoutCall({required Function() forceLogout}) async {
    final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}logout',
        httpMethod: HttpMethod.get,
        isLoadingEnable: false,
        isErrorHandleButtonExists: true,
        errorButtonLabel: 'Force Logout',
        errorButtonPressed: forceLogout);
    globalLogger.d(response, error: "Logout Route");

    is401Call = true;

    if (response['status'] != null && response['status']) {
      return true;
    } else if (response['status'] != null && !(response['status'] == 'ok')) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
}
