import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:lifecoronasafe/constants.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';

class APIRepositoryImpl implements APIRepository {
  @override
  Future<List<String>> getSearchResults(String query) async {
    var searchList = <String>[];
    final options = CacheOptions(
      hitCacheOnErrorExcept: [401, 403],
      maxStale: Duration(hours: 1),
      store: MemCacheStore(),
    );

    try {
      final response = await Dio().get(
        '${Constants.lifeAPI}states.json',
        options: options.copyWith(policy: CachePolicy.refresh).toOptions(),
      );
      if (response.statusCode == 200) {
        final dataMap = response.data as Map<String, dynamic>;
        dataMap.forEach((state, value) {
          searchList.addAll(
              (value as List).map((district) => '$district, $state').toList());
        });
        searchList = extractAll(
          query: query,
          choices: searchList,
          cutoff: 90,
        ).map((e) => e.choice).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return searchList;
  }
}
