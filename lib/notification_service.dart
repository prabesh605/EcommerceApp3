import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kathmandu'));
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);
    await _local.initialize(settings: settings);
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  // Future<void> showNotification() async {
  //   const androidDetails = AndroidNotificationDetails(
  //     'default_channel',
  //     'Default Notification',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //   );
  //   const detail = NotificationDetails(android: androidDetails);
  //   await _local.show(
  //     id: 12,
  //     title: 'abc',
  //     body: '1232',
  //     notificationDetails: detail,
  //   );
  // }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduleTime,
  }) async {
    var tzScheduled = tz.TZDateTime.from(scheduleTime, tz.local);
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notification',
      channelDescription: 'General notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);
    await _local.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: tzScheduled,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
