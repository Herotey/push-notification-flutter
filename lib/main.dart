// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);

// flutter local notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//firebase background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A Background message just showed up :  ${message.messageId}');
  print(message.data);
  showNotification(message);
}

Future<void> main() async {
  // firebase App initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final fc = await FirebaseMessaging.instance.getToken();
  // print(fc);

  //push notification when out app or on OS screen but app open in background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // on message when app open and in the app
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      showNotification(message);
    },
  );

  ///Firebase messaging when app kill or app not running
  FirebaseMessaging.instance.getInitialMessage().then(
    (RemoteMessage? message) {
      showNotification(message!);
    },
  );

  runApp(MyApp());
}

void showNotification(RemoteMessage message) {
  counter++;
  //message.data;
  print('4441111144');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
    counter,
    "${message.data['title']}",
    "${message.data['body']}",
    NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            importance: Importance.high,
            color: Colors.blue,
            playSound: true,
            subText: message.data['subtext'],
            number: 1,
            //channelDescription: message.data['descr'],
            icon: '@mipmap/ic_launcher')),
  );
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

int _counter = 0;
int counter = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var intitializeSettings =
        const InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(intitializeSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification With Firebase"),
        actions: [
          IconButton(
              onPressed:
                  () {}, // showDialog(context: context, builder: builder)
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
              'This is example Push Notification',
              style: TextStyle(
                  fontSize: 20, color: Colors.black), // title in home page
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'this notification is push by firebase message',
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
            const SizedBox(
              height: 20,
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
        onPressed: () {},
        // showNotification(), // button for selected push notification
        tooltip: 'Increment',
        child: const Icon(Icons
            .add), // for push notification on app open and counter notification
      ),
    );
  }
}
