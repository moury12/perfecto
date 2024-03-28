import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/shared/loading.dart';
import 'package:perfecto/theme/theme_data.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ChatController.to.messageList.isNotEmpty
                    ? const Row(
                        children: [
                          Stack(
                            children: [
                              CustomNetworkImage(
                                networkImagePath: '',
                                errorImagePath: AssetsConstant.messageAdmin,
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
                                'Admin',
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
                // const Spacer(),
                // GestureDetector(
                //   child: const Icon(
                //     CupertinoIcons.multiply,
                //     size: 20,
                //   ),
                //   onTap: () {
                //     showDialog(
                //       context: context,
                //       builder: (context) => AlertDialog(
                //         backgroundColor: Colors.white,
                //         surfaceTintColor: Colors.white,
                //         title: const Text(
                //           'Are you sure to disconnect?',
                //           style: AppTheme.textStyleSemiBoldBlack16,
                //         ),
                //         content: Row(
                //           children: [
                //             CustomButton(
                //               onPressed: () {
                //                 Navigator.pop(context);
                //               },
                //               label: 'no',
                //               width: MediaQuery.of(context).size.width / 3.5,
                //               marginHorizontal: 8,
                //               marginVertical: 0,
                //               primary: Colors.white,
                //               borderColor: AppColors.kPrimaryColor,
                //               isBorder: true,
                //               elevation: 0,
                //               labelColor: AppColors.kPrimaryColor,
                //             ),
                //             CustomButton(
                //               onPressed: () {
                //                 Navigator.pop(context);
                //               },
                //               label: 'Yes',
                //               width: MediaQuery.of(context).size.width / 3.5,
                //               marginHorizontal: 8,
                //               marginVertical: 0,
                //             )
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            );
          }),
        ),
        const Divider(
          height: 1,
        ),
        Obx(() => ChatController.to.chatDataLoading.value ? const PerfectoLoading() : const SizedBox()),
        Expanded(
          child: Obx(
            () {
              return ChatController.to.messageList.isEmpty
                  ? GestureDetector(
                      onTap: () {
                        // final newMessage = Message(sender: AssetsConstant.foregrond, content: 'Hi', timestamp: DateTime.now(), isReceived: false);
                        // messageController.addMessage(newMessage);
                      },
                      child: Center(
                          child: Image.asset(
                        AssetsConstant.messageDefault,
                        height: 82,
                      )),
                    )
                  : ListView.builder(
                      controller: ChatController.to.scrollController,
                      reverse: true,
                      padding: EdgeInsets.zero,
                      itemCount: ChatController.to.messageList.length,
                      itemBuilder: (context, index) {
                        final message = ChatController.to.messageList.toList()[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: message.senderId == '0' ? MainAxisAlignment.start : MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0).copyWith(left: message.senderId == '0' ? 64 : 2),
                                    child: Text(
                                      chatTimeAgo(date: message.createdAt!).replaceAll(' ago', ''),
                                      style: const TextStyle(fontSize: 8),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: message.senderId == '0' ? MainAxisAlignment.start : MainAxisAlignment.end,
                                children: [
                                  message.senderId == '0'
                                      ? const Stack(
                                          children: [
                                            CustomNetworkImage(
                                              networkImagePath: '',
                                              errorImagePath: AssetsConstant.messageAdmin,
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
                                        )
                                      : const SizedBox.shrink(),
                                  CustomSizedBox.space20W,
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: message.senderId == '0'
                                            ? BorderRadius.circular(26)
                                            : BorderRadius.circular(26).copyWith(
                                                topRight: const Radius.circular(6),
                                              ),
                                        color: message.senderId == '0' ? const Color(0xff8EE6E1).withOpacity(.11) : AppColors.kPrimaryColor,
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      margin: EdgeInsets.only(
                                        right: message.senderId == '0' ? 80 : 0,
                                        left: message.senderId == '0' ? 0 : 80,
                                      ),
                                      child: /*Stack(
                                        children: [*/
                                          Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (message.image!.isNotEmpty)
                                            CustomNetworkImage(
                                              networkImagePath: message.image!,
                                              errorImagePath: AssetsConstant.messageExpired,
                                              width: MediaQuery.of(context).size.width * .5,
                                              height: MediaQuery.of(context).size.width * .5,
                                              border: NetworkImageBorder.Circle,
                                              borderRadius: 8,
                                              fit: BoxFit.cover,
                                              isPreviewPageNeed: true,
                                              previewPageTitle: 'Image Preview',
                                              previewPageTitleColor: Colors.white,
                                            ),
                                          if (message.image!.isNotEmpty && message.message!.isNotEmpty) CustomSizedBox.space8H,
                                          if (message.message!.isNotEmpty)
                                            Column(
                                              children: [
                                                Text(
                                                  message.message!,
                                                  style: message.senderId == '0' ? AppTheme.textStyleNormalBlack12 : AppTheme.textStyleNormalWhite12,
                                                ),
                                              ],
                                            ),

                                          // CustomSizedBox.space12H,

                                          // Text(
                                          //   message.message!.length.toString() + chatTimeAgo(date: message.createdAt!).replaceAll(' ago', ''),
                                          //   style: TextStyle(fontSize: 8),
                                          // ),
                                        ],
                                      ),
                                      // Positioned(
                                      //   bottom: 12,
                                      //   right: 0,
                                      //   child: Text(
                                      //     chatTimeAgo(date: message.createdAt!).replaceAll(' ago', ''),
                                      //     style: TextStyle(fontSize: 8),
                                      //   ),
                                      // ),
                                      //   ],
                                      // ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
            },
          ),
        ),
        FittedBox(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return ChatController.to.lastImage.value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.file(
                                File(ChatController.to.lastImage.value),
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .85,
                              ),
                              GestureDetector(
                                onTap: () {
                                  ChatController.to.removeImage();
                                },
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink();
                }),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      CustomTextField(
                        width: MediaQuery.of(context).size.width,
                        marginHorizontal: 0,
                        marginVertical: 0,
                        controller: ChatController.to.textController,
                        hintText: 'Type a message...',
                        enableBorderColor: AppColors.kPrimaryColor,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // ChatController.to.toggleIsReceived();
                            ChatController.to.pickImage();
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
                            // final newMessage = Message(
                            //     sender: AssetsConstant.foregrond,
                            //     content: ChatController.to.textController.text,
                            //     timestamp: DateTime.now(),
                            //     isReceived: messageController.isReceived.value);
                            // messageController.addMessage(newMessage);
                            if ((ChatController.to.textController.text.isNotEmpty || ChatController.to.lastImage.value.isNotEmpty) && !ChatController.to.chatSendMsg.value) {
                              ChatController.to.sendMessage(
                                ChatController.to.textController.text,
                              );
                            } else {
                              showSnackBar(msg: 'Type something to send');
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: ChatController.to.chatSendMsg.value
                                  ? const CircularProgressIndicator()
                                  : Image.asset(
                                      AssetsConstant.sendIcon,
                                      color: Colors.white,
                                      height: 30,
                                    ),
                            ),
                          ))
                    ],
                  ),
                ),
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
