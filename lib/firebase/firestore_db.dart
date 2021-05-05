import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDb {
  static FirebaseFirestore get fireStoreInstance {
    return FirebaseFirestore.instance;
  }

  static Future<void> addUser(String token) async {
    fireStoreInstance
        .collection('Users')
        .doc(token)
        .set({'active': true, 'lastlogin': DateTime.now(), 'token': token})
        .then((value) => print('Token Added $token'))
        .catchError((error) => print('Failed to add token: $error'));
  }
}
