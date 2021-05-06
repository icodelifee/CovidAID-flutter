import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lifecoronasafe/firebase/firestore_db.dart';

class FirebaseAuthentication {
  static FirebaseAuth get firebaseAuthInstance {
    return FirebaseAuth.instance;
  }

  static late UserCredential userCredential;
  static late User user;
  static const String VAPID_KEY =
      'BDemkz-pmd4urZdI_pej_b-PUra7MXcY7GfgRaurNgr3956MrwgCSmlBgKCkSAIjAGAo5b5e_TOefQIS20QDI2o';

  static signInAnonymously() async {
    try {
      userCredential = await firebaseAuthInstance.signInAnonymously();
      final String token =
          (await FirebaseMessaging.instance.getToken(vapidKey: VAPID_KEY))!;
      FireStoreDb.addUser(firebaseAuthInstance.currentUser!.uid, token);
    } catch (e) {
      print(e);
    }
  }

  static observeUserAuthState(BuildContext context) {
    Text snackbarText;
    firebaseAuthInstance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is not signed in!');
        snackbarText = const Text('User not signed in');
      } else {
        print('User is signed in!');
        try {
          snackbarText = Text('Signed in anonymously\n UID: ${user.uid}');
        } catch (e) {
          print(e);
          snackbarText = Text(e.toString());
        }
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: snackbarText));
    });
  }
}
