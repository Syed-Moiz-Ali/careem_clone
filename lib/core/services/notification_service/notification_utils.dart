// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:timezone/timezone.dart' as timezone;

// class NotificationUtils {
//   static Future<ByteArrayAndroidBitmap> getImageFromNetwork(
//       String imageUrl) async {
//     try {
//       final response = await http.get(Uri.parse(imageUrl));
//       if (response.statusCode == 200) {
//         return ByteArrayAndroidBitmap.fromBase64String(
//             base64Encode(response.bodyBytes));
//       } else {
//         throw Exception('Failed to load image: ${response.statusCode}');
//       }
//     } catch (e) {
//       debugPrint('Error loading image: $e');
//       throw Exception('Failed to load image');
//     }
//   }

//   static NotificationDetails buildNotificationDetails({
//     required String channelId,
//     BigPictureStyleInformation? bigPictureStyleInformation,
//   }) {
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       channelId,
//       _getChannelNameById(channelId),
//       channelDescription: '',
//       importance: Importance.max,
//       priority: Priority.max,
//       audioAttributesUsage: AudioAttributesUsage.notificationEvent,
//       styleInformation: bigPictureStyleInformation,
//       icon: '@drawable/notification',
//     );

//     return NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: const DarwinNotificationDetails(),
//     );
//   }

//   static String _getChannelNameById(String channelId) {
//     switch (channelId) {
//       case 'chat_channel_id':
//         return 'Chat Notifications';
//       case 'promotion_channel_id':
//         return 'Promotion Notifications';
//       case 'alert_channel_id':
//         return 'Alert Notifications';
//       default:
//         return 'General Notifications';
//     }
//   }

//   static Future<BigPictureStyleInformation?> getBigPictureStyleInformation(
//     String imageUrl,
//     RemoteMessage message,
//   ) async {
//     try {
//       final largeIcon = await getImageFromNetwork(imageUrl);
//       final bigPicture = await getImageFromNetwork(imageUrl);

//       return BigPictureStyleInformation(
//         bigPicture,
//         largeIcon: largeIcon,
//         contentTitle: message.notification?.title ?? 'No Title',
//         htmlFormatContentTitle: true,
//         summaryText: message.notification?.body ?? 'No Body',
//         htmlFormatSummaryText: true,
//       );
//     } catch (e) {
//       debugPrint('Error getting big picture style: $e');
//       return null;
//     }
//   }

//   static Future<void> scheduleNotification(
//       FlutterLocalNotificationsPlugin notification) async {
//     final platformChannelSpecifics =
//         buildNotificationDetails(channelId: 'general_channel_id');

//     await notification.zonedSchedule(
//       1,
//       "Scheduled Notification Title",
//       'Scheduled message goes here',
//       timezone.TZDateTime.now(timezone.local).add(const Duration(seconds: 10)),
//       platformChannelSpecifics,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidScheduleMode: AndroidScheduleMode.exact,
//     );
//   }
// }
