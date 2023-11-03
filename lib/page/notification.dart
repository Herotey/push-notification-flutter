// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:push_notification_firebase/main.dart';

// class DetailsPage extends StatefulWidget {
//   const DetailsPage({super.key});

//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {
//   int _counter = 0;
//   void showNotification() {
//     setState(() {
//       _counter++;
//     });
//     // it is title and body notification push in app
//     flutterLocalNotificationsPlugin.show(
//       0,
//       "Notification testing $_counter",
//       "This is testing Push Notification",
//       NotificationDetails(
//           android: AndroidNotificationDetails(channel.id, channel.name,
//               importance: Importance.high,
//               color: Colors.blue,
//               playSound: true,
//               icon: '@mipmap/ic_launcher')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Details About Notification!!!',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       'assets/image/person.png',
//                     ),
//                     fit: BoxFit.contain,
//                   )),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text("This is Notification when app open"),
//             Text('It is push notificatio when app open'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showNotification,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
// class PushNotification{
//   PushNotification({
//     this.title, this.body
//   });
//   String? title;
//   String? body;
// }


//firebase background message handler
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('A Background message just showed up :  ${message.messageId}');
// }


// // testing 01
// Future<void> setupInteractedMessage(RemoteMessage message) async {
//   RemoteMessage? initialMessage =
//       await FirebaseMessaging.instance.getInitialMessage();

//   if (initialMessage != null) {
//     _handleMessage(initialMessage);
//   }
//   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
// }

// void _handleMessage(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   RemoteNotification? notification = message.notification;
//   print("Notification : $notification");
//   print("Message Data : ${message.data}");
// }


// Firebase local notification plugin
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);



// this function for push notificatio on app open
      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   print('A new messageopen app event was published');
      //   RemoteNotification? notification = message.notification;
      //   AndroidNotification? android = message.notification?.android;
      //   if (notification != null && android != null) {
      //     showDialog(
      //         context: context,
      //         builder: (_) {
      //           return AlertDialog(
      //             title: Text(notification.title.toString()),
      //             content: SingleChildScrollView(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [Text(notification.body.toString())],
      //               ),
      //             ),
      //           );
      //         });
      //   }
      // });

  //   void showNoti() {
  //     // it is title and body notification push in app
  //     flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Message ",
  //       "This is an Flutter Push Notification",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')),
  //     );
  // }


   // FirebaseMessaging.onMessage.listen(
  //   (RemoteMessage message) {
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');
  //     print(message.notification!.title);
  //     print(message.notification!.body);
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification == null && android == null) {
  //         flutterLocalNotificationsPlugin.show(
  //             message.notification.hashCode,
  //            message.notification!.title,
  //            message.notification!.body,
  //             NotificationDetails(
  //               android: AndroidNotificationDetails(
  //                 channel.id,
  //                 channel.name,
  //                 color: Colors.blue,
  //                 playSound: true,
  //                 icon: '@mipmap/ic_lancher',
  //               ),
  //             ));
  //       }
  //   },
  // );


//void showNotification() {
  //   setState(() {
  //     _counter++;
  //     flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Notification $_counter",
  //       "This is an Flutter Push Notification",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')),
  //     );
  //   });
  
  // }


   // FirebaseMessaging.onMessage.listen(
    //   (RemoteMessage message) {
    //     RemoteNotification? notification = message.notification;
    //    AndroidNotification? android = message.notification?.android;
    //    if (notification != null && android != null) {
    //       flutterLocalNotificationsPlugin.show(
    //           notification.hashCode,
    //           notification.title,
    //           notification.body,
    //           NotificationDetails(
    //             android: AndroidNotificationDetails(
    //               channel.id,
    //               channel.name,
    //               color: Colors.blue,
    //               playSound: true,
    //               icon: '@mipmap/ic_lancher',
    //             ),
    //           ));
    //    }
    //   },
    // );