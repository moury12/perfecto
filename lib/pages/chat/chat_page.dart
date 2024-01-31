import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController messageController = Get.put(ChatController());
    globalLogger.d(messageController.messages);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const HomeTopWidget(
          isSearchInclude: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Obx(() {
            return Row(
              children: [
                messageController.messages.isNotEmpty
                    ? const Row(
                        children: [
                          Stack(
                            children: [
                              CustomNetworkImage(
                                networkImagePath: '',
                                errorImagePath: AssetsConstant.foregrond,
                                border: NetworkImageBorder.Circle,
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.circle,
                                    color: Color(0xff09FC5C),
                                    size: 12,
                                  ))
                            ],
                          ),
                          CustomSizedBox.space8W,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Farzarr akteh',
                                style: AppTheme.textStyleSemiBoldBlack12,
                              ),
                              Text(
                                'online',
                                style: TextStyle(color: Color(0xff09FC5C), fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                const Spacer(),
                GestureDetector(
                  child: const Icon(
                    CupertinoIcons.multiply,
                    size: 20,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        title: Text(
                          'Are you sure to disconnect?',
                          style: AppTheme.textStyleSemiBoldBlack16,
                        ),
                        content: Row(
                          children: [
                            CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              label: 'no',
                              width: MediaQuery.of(context).size.width / 3.5,
                              marginHorizontal: 8,
                              marginVertical: 0,
                              primary: Colors.white,
                              borderColor: AppColors.kPrimaryColor,
                              isBorder: true,
                              elevation: 0,
                              labelColor: AppColors.kPrimaryColor,
                            ),
                            CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              label: 'Yes',
                              width: MediaQuery.of(context).size.width / 3.5,
                              marginHorizontal: 8,
                              marginVertical: 0,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: Obx(() {
            return messageController.messages.isEmpty
                ? GestureDetector(
                    onTap: () {
                      final newMessage = Message(sender: AssetsConstant.foregrond, content: 'Hi', timestamp: DateTime.now(), isReceived: false);
                      messageController.addMessage(newMessage);
                    },
                    child: Center(
                        child: Image.asset(
                      AssetsConstant.messageDefault,
                      height: 82,
                    )),
                  )
                : ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.zero,
                    itemCount: ChatController.to.messages.length,
                    itemBuilder: (context, index) {
                      final message = messageController.messages.reversed.toList()[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: message.isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
                          children: [
                            message.isReceived
                                ? Stack(
                                    children: [
                                      CustomNetworkImage(
                                        networkImagePath: '',
                                        errorImagePath: message.sender,
                                        border: NetworkImageBorder.Circle,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      const Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: Icon(
                                            Icons.circle,
                                            color: Color(0xff09FC5C),
                                            size: 12,
                                          ))
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            CustomSizedBox.space20W,
                            Flexible(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: message.isReceived ? BorderRadius.circular(26) : BorderRadius.circular(26).copyWith(topRight: const Radius.circular(6)),
                                color: message.isReceived ? const Color(0xff8EE6E1).withOpacity(.11) : AppColors.kPrimaryColor,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              margin: EdgeInsets.only(right: message.isReceived ? 80 : 0, left: message.isReceived ? 0 : 80),
                              child: Text(
                                message.content,
                                style: message.isReceived ? AppTheme.textStyleNormalBlack12 : AppTheme.textStyleNormalWhite12,
                              ),
                            ))
                          ],
                        ),
                      );
                    },
                  );
          }),
        ),
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CustomTextField(
                  width: MediaQuery.of(context).size.width / 1.15,
                  marginHorizontal: 0,
                  controller: messageController.textController,
                  hintText: 'Type a message...',
                  enableBorderColor: AppColors.kPrimaryColor,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      messageController.toggleIsReceived();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        AssetsConstant.link,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                CustomSizedBox.space8W,
                GestureDetector(
                    onTap: () {
                      final newMessage = Message(
                          sender: AssetsConstant.foregrond,
                          content: messageController.textController.text,
                          timestamp: DateTime.now(),
                          isReceived: messageController.isReceived.value);
                      messageController.addMessage(newMessage);
                    },
                    child: Image.asset(
                      AssetsConstant.sendIcon,
                      height: 30,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Message {
  String sender;
  String content;
  DateTime timestamp;
  bool isReceived; // Add this property

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
    required this.isReceived,
  });
}
