import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import 'package:lifecoronasafe/models/NotificationQueries.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import '../NotificationController.dart';

class SaveNotification extends StatelessWidget {
  const SaveNotification({Key? key, required this.placeCtrl, required this.uid})
      : super(key: key);

  final TextEditingController placeCtrl;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Color(0xFF34C759),
      onPressed: () {
        final state = Get.find<HomePageViewModel>();
        late final NotificationSettingsController notificationController =
            Get.put(NotificationSettingsController(uid: uid));
        if (placeCtrl.text == '') {
          Get.snackbar('Error', 'Please select a district!',
              snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
        } else if (state.resource() == '') {
          Get.snackbar('Error', 'Please select a resource!',
              snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
        } else {
          final split = state.placeCtrl.text.split(',');
          final resource = state.resource();
          debugPrint(split[0]);

          FireStoreDb.addNotification(split[0], split[1], resource, uid)
              .then((result) {
            if (result.isNotEmpty) {
              notificationController.notificationList.add(
                NotificationQueriesModel(
                  docid: result,
                  uid: uid,
                  district: split[0],
                  state: split[1],
                  lastmodified: DateTime.now().toString(),
                  active: true,
                  resource: resource,
                ),
              );
              Get.back();
              Get.rawSnackbar(title: 'Notification Added', message: ' ');
            } else {
              Get.rawSnackbar(
                  title: 'Something went wrong, try again', message: ' ');
            }
          }).catchError((e) {
            Get.rawSnackbar(title: 'Error', message: e.toString());
          });
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ALERT ME',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Gap(10),
          Icon(
            Icons.add_alert,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
