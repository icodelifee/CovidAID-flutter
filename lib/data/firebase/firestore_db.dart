import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lifecoronasafe/models/resource.dart';

class FireStoreDb {
  static FirebaseFirestore get fireStoreInstance {
    return FirebaseFirestore.instance;
  }

  static Future<void> addUser(String uid, String token) async {
    fireStoreInstance.collection('Users').doc(uid).set({
      'active': true,
      'lastlogin': DateTime.now(),
      'token': token
    }).catchError((error) => debugPrint('Failed to add token: $error'));
  }

  static Future<String> updateNotificationSetting(
      String uid, String docid, bool active) async {
    try {
      fireStoreInstance
          .collection('Users')
          .doc(uid)
          .collection('queries')
          .doc(docid)
          .update({'active': active, 'lastmodified': DateTime.now()});
      return 'Update Success';
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<Resource>> getAllResources() async {
    try {
      final snapshot =
          await fireStoreInstance.collection('data').doc('resources').get();
      final rMap = snapshot.data()!['data'] as List;
      return rMap
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      throw FirebaseException(message: e.toString(), plugin: '');
    }
  }
}
