import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  NotificationService() {
    setupNotificationService();
  }

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }

  static Future<void> setupNotificationService() async {
    // iOS notifications setup
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Init firebase notification listeners
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _onAppOpened(event);
    });
    _firebaseMessaging
        .getInitialMessage()
        .then((RemoteMessage? remoteMessage) {

      print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
      print(remoteMessage);
      print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
    });
    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  }

  static Future<void> _onAppOpened(RemoteMessage message) async {
    final data = message.data;
  }

  static _handleMessage(RemoteMessage message) async {
    final data = message.data;

    print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
    print(data);
    print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
  }
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
  print(message.data);
  print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
}
