import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }
}


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    _configureFCM();
    super.initState();
  }

  _configureFCM() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        // Called directly when the app is in foreground
        print('onMessage: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        // Called when the app is in background but not terminated and user
        // taps on the notification in the notifications tray.
        print('onResume: $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        // Called when the app is terminated and user taps on the notification
        // in the notification tray.
        print('onLaunch: $message');
      },
      onBackgroundMessage: myBackgroundMessageHandler
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('FCM Notifications'),
      ),
    );
  }
}
