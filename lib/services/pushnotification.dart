import 'package:firebase_messaging/firebase_messaging.dart';

class Pushnotification{
  final FirebaseMessaging _fcm= FirebaseMessaging();
  Future initialise() async{
    _fcm.configure(
      onMessage: (Map<String,dynamic> message) async {
        print('onMessage: $message');
      },
      onLaunch: (Map<String,dynamic> message) async {
        print('onLanche: $message');
      },
      onResume: (Map<String,dynamic> message) async {
        print('onResume: $message');
      },
    );

  }
}