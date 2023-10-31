import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification_firebase/main.dart';

class NotificationApi {
// create notification terminate app
  static void createNotification(RemoteMessage message) async {
    //final id = tz.TZDateTime.now(tz.local).add(const Duration(milliseconds: 1));
    final id = DateTime.now().microsecond;
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.example.push_notification_firebase",
            "push_notification_firebase",
            importance: Importance.max,
            priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(id, message.notification!.title,
        message.notification!.body, notificationDetails);
  }
}
