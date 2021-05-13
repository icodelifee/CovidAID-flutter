import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(ResourcesController(Get.find()));
    Get.put(PlacesController(), permanent: true);
    Get.put(MappedPlacesController(), permanent: true);
  }
}
