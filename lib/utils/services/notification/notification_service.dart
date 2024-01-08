// Dart imports:
import 'dart:async';

// Package imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Project imports:
import 'package:blinq/data/model/notification/request_notification.dart';
import 'package:blinq/data/model/notification/response_notification.dart';
import 'package:blinq/presentation/notification_dialog/notification_dialog.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const androidChannel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);

class NotificationService {
  //

  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    setupNotificationService();
  }

  //
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static final StreamController<ResponseNotificationDto?>
      _responseNotificationStreamController =
      StreamController<ResponseNotificationDto?>.broadcast();

  static Stream<ResponseNotificationDto?> get responseNotificationStream =>
      _responseNotificationStreamController.stream;

  //
  static Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }

  /// [setupNotificationService] sets up the notification service
  static Future<void> setupNotificationService() async {
    await onCheckPermission();

    _initHeadsUpMode();
    await _getInitialMessage();
    _onMessage();
    _onAppOpened();
    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  }

  static Future<void> onCheckPermission() async {
    await getIt<PermissionServiceImpl>().handleNotificationPermission();
  }

  /// [_initHeadsUpMode] sets up the heads up mode for the notification
  /// so that notificaiton pops up when app is in background
  static void _initHeadsUpMode() async {
    // iOS
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: true,
    );

    // Android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }

  static Future<void> _getInitialMessage() async {
    await FirebaseMessaging.instance.getInitialMessage();
  }

  static void _onMessage() {
    FirebaseMessaging.onMessage.listen((data) {
      _handleMessage(data);
    });
  }

  /// [_onAppOpened] called when the app is opened from a notification
  /// Handle the notification and open the dialog
  static void _onAppOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((data) {
      _handleMessage(data);
    });
  }

  /// [_handleMessage] checks if the notification contains
  /// image, full_name, car, accident_id, id
  static void _handleMessage(RemoteMessage message) async {
    final data = message.data;

    if (data.containsKey('image') && data.containsKey('accident_id')) {
      final RequestNotificationDto requestNotificationDto =
          RequestNotificationDto.fromJson(data);

      NavigationService.showDialog(
        dialog: NotificationDialog(
          requestNotificationDto: requestNotificationDto,
        ),
      );
    }

    if (data.containsKey('answer')) {
      final ResponseNotificationDto responseNotificationDto =
          ResponseNotificationDto.fromJson(data);
      _responseNotificationStreamController.add(responseNotificationDto);
    }
  }

  /// [deleteToken] deletes the token from firebase
  static Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
  }
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  // print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
  // print(message.data);
  // print(message.notification?.title);
  // print(message.notification?.body);
  // print('fkjdnfdskjfndkjfndksjfndksjnfkdsjnfkjsdnfkjsdnfkdsjnf');
}
