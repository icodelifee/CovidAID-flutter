import 'package:lifecoronasafe/data/models/covid_resource_model.dart';

abstract class APIRepository {
  Future<List<String>> getAllStates();
  Future<CovidResources?> fetchResources(
      String state, String district, String resource);
  Future<Map<String, dynamic>> getMappedPlaces();
}
