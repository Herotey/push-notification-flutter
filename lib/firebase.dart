import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification_firebase/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_lancher"));
    _notification.initialize(
      initializationSettings,
    );
  }

  static void createNotification(RemoteMessage message) async {
    final id = tz.TZDateTime.now(tz.local ).add(const Duration(microseconds: 1)) ;
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.example.push_notification_firebase",
            "push_notification_firebase",
            importance: Importance.max,
            priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(id as int, message.notification!.title,
        message.notification!.body, notificationDetails);
  }
}
