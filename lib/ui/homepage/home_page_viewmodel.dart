import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import 'package:lifecoronasafe/models/resource.dart';

class HomePageViewModel extends GetxController {}

class ResourcesController extends GetxController
    with StateMixin<List<Resource>> {
  final Dio dio;
  ResourcesController(this.dio);
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    FireStoreDb.getAllResources().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      change(null, status: RxStatus.error());
    });
  }
}
