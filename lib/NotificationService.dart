import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'dart:math';


class NotificationService {

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _androidNotificationDetails =
  AndroidNotificationDetails(
    'MYID',
    'NOTIFICATION',
    channelDescription: 'Description',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

Future<void> init() async {

/// ANDROID
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo.png');

/// IOS
    final IOSInitializationSettings initializationSettingsIOS =
        const IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> requestNotificationPermission() async {
    final bool? result = await flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
    ?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
    );
  }

  Future<void> showNotification() async {
    const NotificationDetails platformChannelSpecifics =
                NotificationDetails(android: _androidNotificationDetails);
            await flutterLocalNotificationsPlugin.show(
              Random().nextInt(9000), 
              'Hello',
              'World!',
              platformChannelSpecifics,
            );
  }
}