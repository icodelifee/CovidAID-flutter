import 'package:get/get.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';

class SearchPageViewModel extends GetxController {
  RxString resource = RxString('');
  RxBool verified = RxBool(false);
  RxString place = RxString('');
  final APIRepository repo = APIRepositoryImpl();
  Rx<Future<CovidResources?>> resourcesFuture =
      Future.value(CovidResources(resources: [])).obs;

  // ignore: avoid_void_async
  void searchResource() async {
    if (place.value.isEmpty) {
      Get.rawSnackbar(title: 'Search Error', message: 'Please enter a state');
      return;
    }
    final placeSplit = place.value.split(',');
    resourcesFuture.value =
        repo.fetchResources(placeSplit[1], placeSplit[0], resource.value);
  }
}
