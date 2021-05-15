import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:lifecoronasafe/constants.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';

class APIRepositoryImpl implements APIRepository {
  @override
  Future<List<String>> getAllStates() async {
    final searchList = <String>[];

    final options = CacheOptions(
      hitCacheOnErrorExcept: [401, 403],
      maxStale: Duration(hours: 1),
      store: MemCacheStore(),
    );
    try {
      final response = await Dio().get(
        '${Constants.lifeAPI}states.json',
        options: options.copyWith(policy: CachePolicy.request).toOptions(),
      );
      if (response.statusCode == 200) {
        final dataMap = response.data as Map<String, dynamic>;
        dataMap.forEach((state, value) {
          searchList.addAll(
              (value as List).map((district) => '$district, $state').toList());
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return searchList;
  }

  @override
  Future<Map<String, dynamic>> getMappedPlaces() async {
    final options = CacheOptions(
      hitCacheOnErrorExcept: [401, 403],
      maxStale: Duration(hours: 1),
      store: MemCacheStore(),
    );
    try {
      final response = await Dio().get(
        '${Constants.lifeAPI}states.json',
        options: options.copyWith(policy: CachePolicy.request).toOptions(),
      );
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return {};
  }

  @override
  Future<CovidResources?> fetchResources(
      String state, String district, String resource) async {
    final String formattedDistrict = district.trim();
    final String formattedResource = resource.trim();
    final String formattedState = state.trim();
    try {
      final url =
          '${Constants.lifePipelineAPI}resource=$formattedResource&state=$formattedState&district=$formattedDistrict';
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return CovidResources.fromJson(response.data as Map<String, dynamic>);
      } else {
        debugPrint('${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
