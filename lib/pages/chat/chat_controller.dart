import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:perfecto/pages/chat/chat_page.dart';

class ChatController extends GetxController{
  static ChatController get to => Get.find();
  RxList<Message> messages = <Message>[].obs;
  RxBool isReceived = true.obs;
  void addMessage(Message message) {
    messages.add(message);
  }
void toggleIsReceived() {
    isReceived.value = !isReceived.value;
  }
  TextEditingController textController=TextEditingController();
  @override
  void onClose() {
    // TODO: implement onClose
    textController.dispose();
    super.onClose();
  }
}