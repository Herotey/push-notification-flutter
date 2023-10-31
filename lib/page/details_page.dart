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
