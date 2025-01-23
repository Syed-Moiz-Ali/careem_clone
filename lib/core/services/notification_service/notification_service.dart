
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'fcm_service.dart';
// import 'notification_channels.dart';
// import 'notification_utils.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notification =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     // Initialize channels, FCM token, and permissions
//     await NotificationChannels.createNotificationChannels(_notification);
//     await FCMService.updateFCMToken();
//     await FCMService.requestPermission();
//   }

//   static notificationHandler() {
//     // Handle incoming FCM messages
//     FCMService.handleFCMMessages(_notification);
//   }

//   static Future<void> scheduleNotification() async {
//     // Schedule notifications if needed
//     await NotificationUtils.scheduleNotification(_notification);
//   }
// }
