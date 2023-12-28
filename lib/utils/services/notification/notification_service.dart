import 'dart:async';

import 'package:blinq/data/model/notification/request_notification.dart';
import 'package:blinq/data/model/notification/response_notification.dart';
import 'package:blinq/presentation/notification_dialog/notification_dialog.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  NotificationService() {
    setupNotificationService();
  }

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static final StreamController<ResponseNotificationDto?>
      _responseNotificationStreamController =
      StreamController<ResponseNotificationDto?>.broadcast();

  static Stream<ResponseNotificationDto?> get responseNotificationStream =>
      _responseNotificationStreamController.stream;

  static Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }

  static Future<void> setupNotificationService() async {
    // iOS notifications setup
    await _firebaseMessaging.requestPermission(
        alert: true, badge: true, provisional: true, sound: true);

    // Init firebase notification listeners
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });
    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   _onAppOpened(event);
    // });

    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  }

  // static Future<void> _onAppOpened(RemoteMessage message) async {
  //   final data = message.data;
  // }

  static _handleMessage(RemoteMessage message) async {
    final data = message.data;
    // print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
    // print(message.data);
    // print(message.notification?.title);
    // print(message.notification?.body);
    // print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');

    if (data.containsKey('image') && data.containsKey('accident_id')) {
      final RequestNotificationDto requestNotificationDto =
          RequestNotificationDto.fromJson(data);

      NavigationService.showDialog(
          dialog: NotificationDialog(
              requestNotificationDto: requestNotificationDto));
    }

    if (data.containsKey('answer')) {
      final ResponseNotificationDto responseNotificationDto =
          ResponseNotificationDto.fromJson(data);
      _responseNotificationStreamController.add(responseNotificationDto);
    }
  }
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  // print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
  // print(message.data);
  // print(message.notification?.title);
  // print(message.notification?.body);
  // print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
}
