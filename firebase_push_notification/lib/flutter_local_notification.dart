import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  Future notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        icon: "mipmap/ic_launcher",
        playSound: true,
        importance: Importance.max,
      ),
    );
  }

  //local notification show
  Future showNotification(
      {int? id, String? title, String? body, String? payload}) async {
    FlutterLocalNotificationsPlugin notification =
        FlutterLocalNotificationsPlugin();
    await notification.show(id!, title, body, await notificationDetails(),
        payload: payload);
        
  }

  // periodically notification Show
  FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  Future showNotificationPeriodcalOn(
      {int? id, String? title, String? body, String? payload}) async {
    await notification.periodicallyShow(id!, title, body,
        RepeatInterval.everyMinute, await notificationDetails());
  }

  Future showNotificationPeriodcalOff() async {
    notification.cancel(2); //put id number which one want to stop
    // notification.cancelAll(); //cancel all
  }

  //----------------------------


}
