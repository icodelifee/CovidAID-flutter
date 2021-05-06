import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDb {
  static FirebaseFirestore get fireStoreInstance {
    return FirebaseFirestore.instance;
  }

  static Future<void> addUser(String uid, String token) async {
    fireStoreInstance.collection('Users').doc(uid).set({
      'active': true,
      'lastlogin': DateTime.now(),
      'token': token
    }).catchError((error) => print('Failed to add token: $error'));
  }
}
