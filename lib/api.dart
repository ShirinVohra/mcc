import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '0',
    'channel name',
    channelDescription: 'channel description',
    importance: Importance.max,
    priority: Priority.max,
  );

  static final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  showNotifications(
      int id, String? title, String? body, String? payload) async {
    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  static Future _notificationdetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails("channel id", 'channel name',
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.high),
    );
  }

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }
}
