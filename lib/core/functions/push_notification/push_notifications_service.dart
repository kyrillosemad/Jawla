import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//  بالنسبة لنظام iOS:
// إذا كنت تستخدم iOS، يجب إضافة الأذونات التالية في ملف Info.plist:
// xml
// نسخ الكود
// <key>UIBackgroundModes</key>
// <array>
//   <string>fetch</string>
//   <string>remote-notification</string>
// </array>

// <key>FirebaseAppDelegateProxyEnabled</key>
// <false/>

// بالنسبة لنظام Android:
// في AndroidManifest.xml، تأكد من إضافة الأذونات التالية لتشغيل Firebase وFCM:

// xml
// نسخ الكود
// <uses-permission android:name="android.permission.INTERNET"/>
// <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
// <uses-permission android:name="android.permission.VIBRATE"/>

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // الاشتراك في موضوع معين
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    print("Subscribed to topic: $topic");
  }

  // إلغاء الاشتراك من موضوع معين
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    print("Unsubscribed from topic: $topic");
  }

  // الاستماع للإشعارات عندما يكون التطبيق في الخلفية أو الأمام
  void initializeFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received notification: ${message.notification?.title}');
      // يمكنك هنا معالجة الإشعار (مثل عرض تنبيه للمستخدم أو توجيه المستخدم إلى شاشة معينة)
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked: ${message.data}');
      // يمكنك هنا التعامل مع البيانات لتوجيه المستخدم إلى صفحة معينة
    });
  }

  // التعامل مع إشعارات في الخلفية (في حال تم غلق التطبيق)
  Future<void> handleBackgroundMessages(RemoteMessage message) async {
    print('Handling background message: ${message.notification?.title}');
    // يمكنك هنا إضافة الكود الخاص بمعالجة الإشعار في الخلفية
  }

  // طلب إذونات لإظهار الإشعارات
  Future<void> requestNotificationPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print("Notification permission status: ${settings.authorizationStatus}");
  }

  // استخراج FCM Token للجهاز الحالي
  Future<String?> getDeviceFCMToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      print("Device FCM Token: $token");
      return token;
    } catch (e) {
      print("Error getting FCM token: $e");
      return null;
    }
  }

  // إرسال إشعار لجهاز معين باستخدام FCM
  Future<void> sendNotificationToDevice(
      String token, String title, String body) async {
    const String cloudFunctionUrl =
        "https://<your-region>-<your-project-id>.cloudfunctions.net/sendNotificationToDevice";

    try {
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'token': token,
          'title': title,
          'body': body,
        }),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully to device');
      } else {
        print('Error sending notification: ${response.body}');
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

  // إرسال إشعار لموضوع معين
  Future<void> sendNotificationToTopic(
      String topic, String title, String body) async {
    const String cloudFunctionUrl =
        "https://<your-region>-<your-project-id>.cloudfunctions.net/sendNotificationToTopic";

    try {
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'topic': topic,
          'title': title,
          'body': body,
        }),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully to topic');
      } else {
        print('Error sending notification: ${response.body}');
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
