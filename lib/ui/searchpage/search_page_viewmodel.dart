import 'package:get/get.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';

class SearchPageViewModel extends GetxController
    with StateMixin<CovidResources?> {
  RxString resource = RxString('');
  RxBool verified = RxBool(false);
  RxString pstate = RxString('');
  RxString district = RxString('');
  final APIRepository repo = APIRepositoryImpl();
  Rx<Future<CovidResources?>> resourcesFuture =
      Future.value(CovidResources(resources: [])).obs;

  // ignore: avoid_void_async
  void searchResource() async {
    if (district.value.isEmpty || pstate.value.isEmpty) {
      Get.rawSnackbar(title: 'Search Error', message: 'Please enter a state');
      return;
    }
    change(null, status: RxStatus.loading());
    repo
        .fetchResources(
            pstate.value.trim(), district.value.trim(), resource.value)
        .then((value) => change(value, status: RxStatus.success()))
        .catchError((onError) => change(null, status: RxStatus.error()));
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
