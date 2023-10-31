import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification_firebase/terminate_noti.dart';
//import 'package:push_notification_firebase/page/details_page.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title// description
    importance: Importance.high,
    playSound: true);

// flutter local notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//firebase background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A Background message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  // firebase App initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

// Firebase local notification plugin
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

//Firebase messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Push Notification',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //tz.initializeTimeZones();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      NotificationApi.createNotification(message!);
    });
    // make notification on message
    // FirebaseMessaging.onMessage.listen(
    //   (RemoteMessage message) {
    //     RemoteNotification? notification = message.notification;
    //     AndroidNotification? android = message.notification?.android;
    //     if (notification != null && android != null) {
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
    //     }
    //     // this is notification for push when isn't run or out app
    //     NotificationApi.createNotification(message);
    //   },
    // );
// this function for push notificatio on app open
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new messageopen app event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNoti() {
    setState(() {
      _counter++;
    });
    // it is title and body notification push in app
    flutterLocalNotificationsPlugin.show(
      0,
      "Message Notification $_counter",
      "This is an Flutter Push Notification",
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              importance: Importance.high,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher')),
    );
  }

  void showNotification() {
    setState(() {
      _counter++;
      flutterLocalNotificationsPlugin.show(
      0,
      "Notification $_counter",
      "This is an Flutter Push Notification",
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              importance: Importance.high,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher')),
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => showNoti(),
              icon: const Icon(
                Icons.notification_add,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              // title in home page
              'This is example for Push Notification in flutter app',
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    // image in home page
                    image: AssetImage('assets/image/person.png')),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification, // button for selected push notification
        tooltip: 'Increment',
        child: const Icon(Icons
            .add), // for push notification on app open and counter notification
      ),
    );
  }
}
