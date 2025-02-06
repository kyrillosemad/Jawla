import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

//  with flutter_local_notifications package
//  Android Setup
//  await LocalNotificationService.initialize(); in main
//  depend on user mobile so all users are separated

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool notificationsEnabled = true; // متغير لتفعيل/تعطيل الإشعارات

  // تهيئة الإشعارات
  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitialization =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitialization);

    await _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  // إضافة إشعار بسيط
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!notificationsEnabled) {
      return; // إذا كانت الإشعارات غير مفعلة، لا ترسل الإشعار
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'simple_channel_id',
      'Simple Notifications',
      channelDescription: 'Channel for simple notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // معرف فريد للإشعار
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  // إضافة إشعار مجدول
  static Future<void> showScheduledNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
  }) async {
    if (!notificationsEnabled) {
      return; // إذا كانت الإشعارات غير مفعلة، لا ترسل الإشعار
    }

    tz.initializeTimeZones();

    await _notificationsPlugin.zonedSchedule(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // معرف فريد للإشعار
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'scheduled_channel_id',
          'Scheduled Notifications',
          channelDescription: 'Channel for scheduled notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle:
          true, // السماح بالإشعار حتى لو الجهاز في وضع الخمول
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  // إضافة إشعار متكرر
  static Future<void> showPeriodicNotification({
    required String title,
    required String body,
    required RepeatInterval interval,
    String? payload,
  }) async {
    if (!notificationsEnabled) {
      return; // إذا كانت الإشعارات غير مفعلة، لا ترسل الإشعار
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'periodic_channel_id',
      'Periodic Notifications',
      channelDescription: 'Channel for periodic notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.periodicallyShow(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // معرف فريد للإشعار
      title,
      body,
      interval,
      notificationDetails,
      androidAllowWhileIdle: true,
      payload: payload,
    );
  }

  // إضافة إشعار بصوت مخصص
  static Future<void> showNotificationWithSound({
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!notificationsEnabled) {
      return; // إذا كانت الإشعارات غير مفعلة، لا ترسل الإشعار
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'sound_channel_id',
      'Sound Notifications',
      channelDescription: 'Channel for notifications with sound',
      importance: Importance.max,
      priority: Priority.high,
      sound:
          RawResourceAndroidNotificationSound('custom_sound'), // اسم ملف الصوت
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // معرف فريد للإشعار
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  // حذف إشعار معين
  static Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  // حذف جميع الإشعارات
  static Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }

  // تغيير حالة الإشعارات
  static void toggleNotifications(bool enabled) {
    notificationsEnabled = enabled;
  }
}
