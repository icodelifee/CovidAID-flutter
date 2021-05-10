import 'package:get/get.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import 'package:lifecoronasafe/models/NotificationQueries.dart';

class NotificationSettingsController extends GetxController {
  NotificationSettingsController({required this.uid});

  String uid;
  RxBool isLoading = false.obs;
  RxList<NotificationQueriesModel> notificationList =
      <NotificationQueriesModel>[].obs;

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  void fetchNotifications() async {
    try {
      isLoading(true);
      final notifications = await FireStoreDb.getAllNotification(uid);
      notificationList.value = notifications;
    } finally {
      isLoading(false);
    }
  }
}
