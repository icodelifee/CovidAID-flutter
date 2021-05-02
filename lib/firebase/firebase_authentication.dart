import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  static FirebaseAuth get firebaseAuthInstance {
    return FirebaseAuth.instance;
  }

  static late UserCredential userCredential;
  static late User user;

  static signInAnonymously() async {
    try {
      userCredential = await firebaseAuthInstance.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }
}
