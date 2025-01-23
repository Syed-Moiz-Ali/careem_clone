// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationChannels {
//   static const String chatChannelId = 'chat_channel_id';
//   static const String promotionChannelId = 'promotion_channel_id';
//   static const String alertChannelId = 'alert_channel_id';
//   static const String generalChannelId = 'general_channel_id';
//   static const String chatChannelName = 'Chat Notifications';
//   static const String promotionChannelName = 'Promotion Notifications';
//   static const String alertChannelName = 'Alert Notifications';
//   static const String generalChannelName = 'General Notifications';
//   static const String channelDescription = '';

//   static Future<void> createNotificationChannels(
//       FlutterLocalNotificationsPlugin notification) async {
//     const androidChatChannel = AndroidNotificationChannel(
//       chatChannelId,
//       chatChannelName,
//       description: channelDescription,
//       importance: Importance.max,
//       playSound: true,
//       audioAttributesUsage: AudioAttributesUsage.notificationEvent,
//     );

//     const androidPromotionChannel = AndroidNotificationChannel(
//       promotionChannelId,
//       promotionChannelName,
//       description: channelDescription,
//       importance: Importance.max,
//       playSound: true,
//       audioAttributesUsage: AudioAttributesUsage.notificationEvent,
//     );

//     const androidAlertChannel = AndroidNotificationChannel(
//       alertChannelId,
//       alertChannelName,
//       description: channelDescription,
//       importance: Importance.max,
//       playSound: true,
//       audioAttributesUsage: AudioAttributesUsage.notificationEvent,
//     );

//     const androidGeneralChannel = AndroidNotificationChannel(
//       generalChannelId,
//       generalChannelName,
//       description: channelDescription,
//       importance: Importance.max,
//       playSound: true,
//       audioAttributesUsage: AudioAttributesUsage.notificationEvent,
//     );

//     await notification
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidChatChannel);

//     await notification
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidPromotionChannel);

//     await notification
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidAlertChannel);

//     await notification
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidGeneralChannel);
//   }
// }
