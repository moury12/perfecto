import 'dart:convert';
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
// import 'package:open_file/open_file.dart';
// import 'package:open_filex/open_filex.dart';
//
// @pragma('vm:entry-point')
// Future<void> notificationTapBackground(NotificationResponse notificationResponse) async {
//   print('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with'
//       ' payload: ${notificationResponse.payload}');
//   if (notificationResponse.payload != null) {
//     await OpenFilex.open(notificationResponse.payload);
//   }
//   if (notificationResponse.actionId == 'open') {
//     await OpenFilex.open(notificationResponse.payload);
//   }
// }

class NotificationService {
  static int currentIndex = 1000;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  NotificationService() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    try {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    } catch (e) {
      globalLogger.e(e);
    }
    final AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (notificationResponse) async {
      print('notification(${notificationResponse.id}) action tapped: '
          '${notificationResponse.actionId} with'
          ' payload: ${notificationResponse.payload}');
      // if (notificationResponse.payload != null) {
      //   await OpenFilex.open(notificationResponse.payload);
      // }
      // if (notificationResponse.actionId == 'open') {
      //   await OpenFilex.open(notificationResponse.payload);
      // }
    } /*, onDidReceiveBackgroundNotificationResponse: notificationTapBackground*/);
  }

  Future<void> updateDownloadProgress(int id, int progress, String downloadMessage, String body, String? payload) async {
    final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'download_channel_id',
      'Download Channel',
      channelDescription: 'Notification Channel for Downloads',
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
      showProgress: progress != 100,
      maxProgress: 100,
      progress: progress,
      colorized: true,
      actions: [
        // if (progress == 100) const AndroidNotificationAction('open', 'Open File', inputs: [AndroidNotificationActionInput(label: 'hello')]),
      ],
    );

    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(id, downloadMessage, body, notificationDetails, payload: payload);
  }

  Future<void> sendNotifications(RemoteMessage message) async {
    currentIndex++;
    // final NotificationAppLaunchDetails? notificationAppLaunchDetails = await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel01',
      'description',
      channelDescription: 'Test',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    // final map = {
    //   "payload": "Notification Route",
    //   "title": message.notification!.title,
    //   "body": message.notification!.body,
    //   "job_id": message.data['job_id'],
    // };
    await _flutterLocalNotificationsPlugin.show(
      currentIndex,
      message.notification!.title,
      message.notification!.body,
      notificationDetails, /*payload: json.encode(map)*/
    );
  }
}
