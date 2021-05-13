import 'package:get/get.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';

class SearchPageViewModel extends GetxController {
  RxString resource = RxString('');
  RxBool verified = RxBool(false);
  RxString state = RxString('');
  RxString district = RxString('');
  final APIRepository repo = APIRepositoryImpl();
  Rx<Future<CovidResources?>> resourcesFuture =
      Future.value(CovidResources(resources: [])).obs;

  // ignore: avoid_void_async
  void searchResource() async {
    if (district.value.isEmpty || state.value.isEmpty) {
      Get.rawSnackbar(title: 'Search Error', message: 'Please enter a state');
      return;
    }
    resourcesFuture.value = repo.fetchResources(
        state.value.trim(), district.value.trim(), resource.value);
  }
}

class MappedPlacesController extends GetxController {
  RxMap<String, dynamic> mappedPlaces = RxMap<String, dynamic>();
  final APIRepository repo = APIRepositoryImpl();

  @override
  //ignore: avoid_void_async
  void onInit() async {
    super.onInit();
    mappedPlaces.value = await repo.getMappedPlaces();
  }
}
