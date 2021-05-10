import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lifecoronasafe/models/NotificationQueries.dart';
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

  static Future<String> addNotification(
      String district, String state, String resource, String uid) async {
    try {
      final data = await fireStoreInstance
          .collection('Users')
          .doc(uid)
          .collection('queries')
          .add({
        'district': district,
        'state': state,
        'resource': resource,
        'active': true,
        'lastmodified': DateTime.now()
      });
      return data.id;
    } catch (e) {
      throw FirebaseException(message: e.toString(), plugin: '');
    }
  }

  static Future<List<NotificationQueriesModel>> getAllNotification(
      String uid) async {
    try {
      final snapshot = await FireStoreDb.fireStoreInstance
          .collection('Users')
          .doc(uid)
          .collection('queries')
          .get();
      return snapshot.docs
          .map((e) => NotificationQueriesModel.fromJson(
              {'docid': e.id, 'uid': uid, ...e.data()}))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      throw FirebaseException(message: e.toString(), plugin: '');
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
