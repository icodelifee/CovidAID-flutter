import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/Notification/NotificationController.dart';
import 'package:lifecoronasafe/ui/Notification/widget/saveNotification.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/place_textfield.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/resource_selector.dart';

import 'widget/NotificationTileView.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  static String uid = FirebaseAuth.instance.currentUser!.uid;
  final placeCtrl = TextEditingController();
  late NotificationSettingsController notificationController =
      Get.put(NotificationSettingsController(uid: uid));

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
        backgroundColor: Color(0xFF34C759),
        onPressed: () {
          Get.bottomSheet(
            BottomSheet(
              onClosing: () {},
              builder: (context) => Container(
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PlaceTextField(),
                      Gap(15),
                      ResourceSelector(),
                      Gap(15),
                      SaveNotification(placeCtrl: placeCtrl, uid: uid)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Obx(() {
        if (notificationController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (notificationController.notificationList.isEmpty) {
          return const Center(
            child: Text('No Notification subscribed'),
          );
        }
        return ListView.builder(
            itemCount: notificationController.notificationList.length,
            itemBuilder: (context, index) {
              return NotificationTile(
                  data: notificationController.notificationList[index]);
            });
      }),
    );
  }
}
