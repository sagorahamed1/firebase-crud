import 'package:firebase_crud/views/screens/notification/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseApi{
  final _firebaseMessagin = FirebaseMessaging.instance;

  Future<void> initNotifications()async{
       await _firebaseMessagin.requestPermission();

       final fomToken = await _firebaseMessagin.getToken();
       print("token-----:$fomToken");
  }

  void handelMessage(RemoteMessage message){
    if(message!= null) {
      print("---------------------------------$message");
      Get.to(NotificationScreen(notification:  "$message",));
  }
  }


  Future initPushNotification() async{
    // FirebaseMessaging.instance.getInitialMessage().then((value) => handelMessage(RemoteMessage()),);

    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
  }
}