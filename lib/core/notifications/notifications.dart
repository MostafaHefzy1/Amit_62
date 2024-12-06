import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  static initFirebaseNotifications() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    FirebaseMessaging.onMessage.listen((event) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 1,
        channelKey: 'firebase',
        actionType: ActionType.Default,
        title: event.notification!.title,
        body: event.notification!.body,
      ));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 2,
        channelKey: 'firebase',
        actionType: ActionType.Default,
        title: event.notification!.title,
        body: event.notification!.body,
      ));
    });
  }
}
