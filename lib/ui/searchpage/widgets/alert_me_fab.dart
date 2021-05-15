import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/firebase/firebase_authentication.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import '../search_page_viewmodel.dart';

class AlertMeFAB extends StatelessWidget {
  AlertMeFAB({
    Key? key,
  }) : super(key: key);

  final ctrl = Get.find<SearchPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        await FireStoreDb.addNotification(
            ctrl.district(),
            ctrl.pstate(),
            ctrl.resource(),
            FirebaseAuthentication.firebaseAuthInstance.currentUser!.uid
                .toString());
        Get.rawSnackbar(
            title: 'Alert added successfully',
            message: 'You will be notified when the resource is available');
      },
      label: Row(
        children: [
          Text(
            'Alert Me',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Gap(8),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Color(0xFF34C759),
    );
  }
}
