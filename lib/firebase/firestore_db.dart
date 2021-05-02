import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDb {
  static FirebaseFirestore get fireStoreInstance {
    return FirebaseFirestore.instance;
  }
}
