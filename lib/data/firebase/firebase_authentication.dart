import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/constants.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';

class FirebaseAuthentication {
  static FirebaseAuth get firebaseAuthInstance {
    return FirebaseAuth.instance;
  }

  static late UserCredential userCredential;
  static late User user;

  static Future<void> signInAnonymously() async {
    try {
      userCredential = await firebaseAuthInstance.signInAnonymously();
      final String token = (await FirebaseMessaging.instance
          .getToken(vapidKey: Constants.VAPID_KEY))!;
      FireStoreDb.addUser(firebaseAuthInstance.currentUser!.uid, token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> observeUserAuthState() async {
    Text snackbarText;
    firebaseAuthInstance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is not signed in!');
        snackbarText = Text('Some error occured while registering your device');
      } else {
        debugPrint('User is signed in!');
        snackbarText = Text('This device has been connected to database');
      }
      Get.showSnackbar(GetBar(messageText: snackbarText));
    });
  }
}
