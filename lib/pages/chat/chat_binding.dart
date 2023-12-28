import 'package:get/get.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';



class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(
      ChatController(),
    );
  }
}
