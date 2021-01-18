import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/views/detail_view.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  StringFormat _format = StringFormat();

  Future subscribeToEvent() async {
    await _fcm.subscribeToTopic('Event');
  }

  Future initialise(BuildContext context) async {
    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        // String event = message['topic'];
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        // String event = message['topic'];
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        // String event = message['topic'];
        return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailView(
                    title: message["notification"]["title"],
                    detail: message["notification"]["title"],
                    datetime: message["date"],
                  )),
        );
      },
    );
    _fcm.requestNotificationPermissions(const IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));
    _fcm.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _fcm.getToken().then((String token) {
      assert(token != null);
      // print("===TOKEN : " + token);
    });
  }

  /* void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'create_post') {
        print("Create Post");
      }
    }
  } */
}
