import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';

class ResourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(ResourcesController(Get.find()));
  }
}
