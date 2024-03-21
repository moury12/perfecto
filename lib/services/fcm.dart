import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/services/notification_service.dart';

import '../../main.dart';

Future<void> setupFirebaseMessenging() async {
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {
    globalLogger.d(message?.toMap(), 'getInitialMessaage');
    // if (message != null && message.data != null && message.data['job_id'] != null) {
    //   Get.put<HomeController>(HomeController(), permanent: true);
    //   await HomeController.to.jobDetailsCall({"job_id": message.data['job_id']! as String});
    //   Navigator.push(navigatorKey!.currentContext!, MaterialPageRoute(builder: (_) => JobDetailsScreen(/*message:data['body']*/)));
    //   print('getInitialMessaage');
    //   print(message);
    // }
  });

  // onMessage is called when app is in foreground
  // and a message is arrived

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print("onMessage");
    print(message);
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    globalLogger.d(message.toMap());

    final type = message.data['type'];

    // joinMeeting(
    //     isVideoCallOptionEnable: body['type'] == 'audio' ? false : true);
    // globalLogger.d(info);
    service!.sendNotifications(message);
    // fcmNotification(message.notification!.title!, message.notification!.body!);
    if (notification != null && android != null) {
      // flutterLocalNotificationsPlugin.show(
      //     notification.hashCode,
      //     notification.title,
      //     notification.body,
      //     NotificationDetails(
      //       android: AndroidNotificationDetails(
      //         channel.id,
      //         channel.name,
      //         channel.description,
      //         // TODO add a proper drawable resource to android, for
      //
      //
      //
      //          now using
      //         //      one that already exists in example app.
      //         icon: 'launch_background',
      //       ),
      //     ));
    }
  });

  // onMessageOpnedApp is called when a notification is clicked
  // from the system tray and the app is opened by it.
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    globalLogger.d("Yes I got it");
    // await fcmNotification(
    //     message.notification!.title!, message.notification!.body!);
    //
    // if (message != null && message.data != null && message.data['job_id'] != null) {
    //   Get.put<HomeController>(HomeController(), permanent: true);
    //   await HomeController.to.jobDetailsCall({"job_id": message.data['job_id']! as String});
    //   Navigator.push(navigatorKey!.currentContext!, MaterialPageRoute(builder: (_) => JobDetailsScreen(/*message:data['body']*/)));
    //   print('getInitialMessaage');
    //   print(message);
    // }
    //
    print('onMessageOpenedApp');
    print('A new onMessageOpenedApp event was published!');
    // Navigator.pushNamed(context, '/message',
    //     arguments: MessageArguments(message, true));
  });
}

/// Define a top-level named handler which background/terminated messages will
/// call.
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  service = NotificationService();

  print('_firebaseMessagingBackgroundHandler');
  globalLogger.d(message.toMap());
  globalLogger.d(service.toString());
  service!.sendNotifications(message);
  // fcmNotification(message.notification!.title!, message.notification!.body!);
}

Future<void> sendPushMessage({
  required String body,
  required String title,
  required String token,
}) async {
  try {
    await ServiceAPI.genericCall(
      url: 'https://fcm.googleapis.com/fcm/send',
      httpMethod: HttpMethod.post,
      noNeedAuthToken: true,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAanr0KaY:APA91bEtYG8axKudxtbzGEaFXzZ7_CCYfLGKrzc9c4w4z9T71uz4r9h5WV74EBdhUR1gXd5I4VyP0YAV9IjBiLL6hI6fMik0ceWTShlUrZUrKHFmRosdEQHc-FlTYLSz68avGIQxtAo-',
      },
      body: jsonEncode(
        {
          "notification": {"body": body, "title": title},
          "priority": "high",
          "timeToLive": 24 * 60 * 60,
          "data": {
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "id": "1",
            "status": "done",
          },
          "to": token,
        },
      ),
    );

    // http.post(
    //   Uri.parse('https://fcm.googleapis.com/fcm/send'),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Authorization':
    //         'key=AAAAKIxlEZg:APA91bFL0IOjrgh5bol-N8-3nBqzMfgFumVsQp_eSjABmmJ6UZ_dHNh_Y6RWxcyXtn74OUuikLlQwY-vRNKEGS9KOcBhyH6v4RYAy18Jt2_RE2XfR58lcKWxJHRxkbat6dOz1JJbrezB',
    //   },
    //   body: jsonEncode(
    //     {
    //       'notification': {'body': body, 'title': title},
    //       'priority': 'high',
    //       'timeToLive': 24 * 60 * 60,
    //       'data': {
    //         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    //         'id': '1',
    //         'status': 'done',
    //         'type': notificationType,
    //         'postid': uuid.v4(),
    //         "addition": {
    //           'call_status': callStatus,
    //           'type': callType,
    //         },
    //       },
    //       "to": token,
    //     },
    //   ),
    // );
  } catch (e) {
    print("error push notification");
  }
}

// Future sendMessage(
//     {required String callStatus,
//     required String type,
//     required String token}) async {
//     final token = await _getToken();
//     globalLogger.d(token);
//   globalLogger.d('called');
//   var func = FirebaseFunctions.instance.httpsCallable("notifySubscribers");
//   final data = {
//     'notification_type': 'call',
//     'body': 'Calling',
//     'room_id': 'myroom111',
//     'call_status': callStatus,
//     'type': type,
//   };
//
//   String jsonStringMap = json.encode(data);
//   var res = await func.call(<String, dynamic>{
//     "targetDevices": [token],
//     "messageTitle": "Test title",
//     "messageBody": jsonStringMap,
//   });
//   globalLogger.d(data, res.data);
//   print("message was ${res.data as bool ? "sent!" : "not sent!"}");
// }
