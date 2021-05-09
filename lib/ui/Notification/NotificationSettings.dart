import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';

import 'NotificationTileView.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Notification Settings',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FireStoreDb.fireStoreInstance
              .collection('Users')
              .doc(uid)
              .collection('queries')
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final queriesData = snapshot.data?.docs;
            if (queriesData == null || queriesData.isEmpty) {
              return const Center(
                child: Text('No Notification subscribed'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return NotificationTile(
                  data: {
                    'docid': queriesData[index].id,
                    'uid': uid,
                    ...queriesData[index].data()
                  },
                );
              },
            );
          }),
    );
  }
}