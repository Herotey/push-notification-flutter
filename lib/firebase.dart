import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification_firebase/main.dart';

class NotificationApi {
  //static final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();

  static void initialize() {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_lancher"));
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static createNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
              "pushnotification", "pushnotificationchannel",
              importance: Importance.max, priority: Priority.high));
      await flutterLocalNotificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails);
    } on Exception catch (e) {
      print(e);
    }
  }

//   static scheduleNotification() async {
//     timezone.initializeTimeZones();
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'channel id',
//       'channel name',
//       channelDescription: 'channel description',
//       importance: Importance.max, // set the importance of the notification
//       priority: Priority.high, // set prority
//     );
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//     await _notification.zonedSchedule(
//         "id" as int,
//         "notification title",
//         'Message goes here',
//         timezone.TZDateTime.now(timezone.local).add(const Duration(seconds: 10)),
//         platformChannelSpecifics,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true);

// }
//  static pushNotification(
//     RemoteMessage message,
//   ) async {
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'channed id',
//       'channel name',
//       channelDescription: 'channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//     await _notification.show(
//         'id' as int,
//         message.notification!.title,
//         message.notification!.body,
//         platformChannelSpecifics);
  //}
}
