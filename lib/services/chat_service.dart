import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:perfecto/models/message_model.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';

class ChatService {
  static Future<ChatModel> getChats(bool initialCall) async {
    ChatModel chatModel = ChatModel();
    try {
      final response = await ServiceAPI.genericCall(
        url:
            '${Service.apiUrl}get-message?page=${initialCall ? '1' : ChatController.to.chat.value.messageDetails!.nextPageUrl!.isNotEmpty ? ChatController.to.chat.value.messageDetails!.nextPageUrl!.split('=')[1] : '1'}&perPage=15',
        httpMethod: HttpMethod.get,
      );
      globalLogger.d(response, error: "Chat Route");
      if (response['status'] != null && response['status']) {
        chatModel = ChatModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return chatModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return chatModel; // Return an empty list or handle the error accordingly
    }
  }

  static Future<MessageModel> readMessage() async {
    MessageModel msgModel = MessageModel();
    try {
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}read-message',
        httpMethod: HttpMethod.get,
      );
      globalLogger.d(response, error: "read msg Route");
      if (response['status'] != null && response['status']) {
        msgModel = MessageModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return msgModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return msgModel; // Return an empty list or handle the error accordingly
    }
  }

  static Future<MessageModel> sendMessage({dynamic body, List<Map<String, dynamic>>? imageList}) async {
    MessageModel msgModel = MessageModel();
    try {
      final response = await ServiceAPI.genericCall(
        url: '${Service.apiUrl}send-message',
        httpMethod: HttpMethod.multipartFilePost,
        allInfoField: body,
        imageListWithKeyValue: imageList,
      );
      globalLogger.d(response, error: "send msg Route");
      if (response['status'] != null && response['status']) {
        msgModel = MessageModel.fromJson(response['data']);
      } else if (response['status'] != null && !response['status']) {
        ServiceAPI.showAlert(response['message']);
      }
      return msgModel;
    } catch (e) {
      globalLogger.e("Error occurred in Call: $e");
      return msgModel; // Return an empty list or handle the error accordingly
    }
  }
}
