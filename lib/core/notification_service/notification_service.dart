import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quiz/core/router/app_router_names.dart';

class NotificationService {
  
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestAndRegisterNotification() async {
    // Request permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      badge: true,
      provisional: true,
      sound: true,
    );
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User denied permission');
    }
  }

  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('drawable/ic_stat_logo');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings,onDidReceiveNotificationResponse: (onDidReceiveNotificationResponse){
      // Navigator.pushNamed(onDidReceiveNotificationResponse., AppRouterNames.rChatDetailsScreen,arguments: onDidReceiveNotificationResponse.payload);
      print(onDidReceiveNotificationResponse.payload);
    });
  }

  Future<void> firebaseNotificaitnInit(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    // final token = await FirebaseMessaging.instance.getToken();

    // print("SNDLKSNDLSD ${token}");

    FirebaseMessaging.onMessage.listen(
      (message) async {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        AppleNotification? ios = message.notification?.apple;

        AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          android?.channelId ?? "high_importance_channel",
          'High Importance Notifications',
          enableVibration: true,
          // sound: RawResourceAndroidNotificationSound(android?.sound ?? ""),
          importance: Importance.max,
          priority: Priority.max,
          icon: '@drawable/ic_stat_logo',
          color: Color(0xffFF0000),
        );

        print("soundAndroid ${android?.sound ?? ""}");

        print("soundIOS ${ios?.sound ?? ""}");

        var not = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: const DarwinNotificationDetails(sound: "bubble.caf"),
        );

        if (Platform.isAndroid) {
          await flutterLocalNotificationsPlugin.show(notification.hashCode,
              notification?.title, notification?.body, not);
        }
      },
    );
  }

  Future<void> createChannel(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidNotificationChannel = const AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notifications",
      description: "High Importance Notifications",
      importance: Importance.max,
      // sound: RawResourceAndroidNotificationSound(sound),
    );

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }
}
