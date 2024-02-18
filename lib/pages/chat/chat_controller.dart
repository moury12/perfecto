import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/controller/user_controller.dart';
import 'package:perfecto/models/message_model.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/services/chat_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  static ChatController get to => Get.find();

  final RxList<MessageModel> _messageList = <MessageModel>[].obs;

  RxList<MessageModel> get messageList => _messageList;
  Rx<ChatModel> chat = ChatModel().obs;

  RxList<Message> messages = <Message>[].obs;

  RxString lastImage = ''.obs;

  final ImagePicker imagePicker = ImagePicker();
  RxBool isReceived = true.obs;
  void addMessage(Message message) {
    messages.add(message);
  }

  void toggleIsReceived() {
    isReceived.value = !isReceived.value;
  }

  TextEditingController textController = TextEditingController();
  @override
  void onClose() {
    // TODO: implement onClose
    textController.dispose();
    super.onClose();
  }

  @override
  onInit() {
    super.onInit();
    initSocket();
    getChats();
  }

  IO.Socket socket = IO.io("http://192.168.1.63:3000", <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket', 'polling'],
  });

  initSocket() {
    globalLogger.d('Init Socket Enter');
    // globalLogger.d(socket!.id, 'Socket Var');
    socket.onConnect((_) {
      globalLogger.d('Socket Enter');
      socket.on('chat message', (newMessage) {
        globalLogger.d(newMessage, 'Send To Pharmacy');
        if (newMessage['sender_id'] == '0' && newMessage['receiver_id'] == UserController.to.getUserInfo.id!) {
          getChats();
        }
      });
    });
    socket.connect();
    socket.onDisconnect((_) => globalLogger.d('Connection Disconnection'));
    socket.onConnectError((err) => globalLogger.e(err));
    socket.onError((err) => globalLogger.e(err));
  }

  Future<void> sendMessage(dynamic message) async {
    final List<Map<String, dynamic>>? imageList = lastImage.isNotEmpty
        ? [
            {
              'key': 'image',
              'value': lastImage.value,
            }
          ]
        : null;
    final data = await ChatService.sendMessage(body: {'message': message.toString()}, imageList: imageList);
    if (data.id != null) {
      socket.emit('chat message', data.toJson());
      getChats();
      lastImage.value = '';
      textController.clear();
      lastImage.refresh();
    }
  }

  Future<void> getChats([bool initialCall = true]) async {
    if (initialCall) {
      _messageList.clear();
      messageList.refresh();
    }
    final data = await ChatService.getChats(initialCall);
    chat.value = data;
    if (data.messageDetails!.data!.isNotEmpty) {
      _messageList.addAll(data.messageDetails!.data!);
      messageList.refresh();
    }
  }

  Future<void> readMessage() async {
    final data = await ChatService.readMessage();
  }

  void pickImage() {
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        lastImage.value = value.path;

        lastImage.refresh();
      }
    });
  }

  void removeImage() {
    lastImage.value = '';
  }
}
