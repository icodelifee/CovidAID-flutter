import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';
import 'package:lifecoronasafe/models/resource.dart';

class HomePageViewModel extends GetxController {
  RxString resource = RxString('');
  RxBool verified = RxBool(false);
  final placeCtrl = TextEditingController();
  RxList<String> places = RxList<String>();
  final APIRepository repo = APIRepositoryImpl();

  @override
  // ignore: avoid_void_async
  void onInit() async {
    super.onInit();
    places.value = await repo.getAllStates();
  }
}

class PlacesController extends GetxController {
  RxList<String> places = RxList<String>();
  final APIRepository repo = APIRepositoryImpl();
  @override
  // ignore: avoid_void_async
  void onInit() async {
    super.onInit();
    places.value = await repo.getAllStates();
  }
}

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
