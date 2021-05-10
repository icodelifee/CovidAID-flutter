import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_appbar.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_resource_selector.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_textfield.dart';
import 'package:dio/dio.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_verified.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    Key? key,
    this.state,
    this.district,
    this.resource,
    this.isVerified,
  }) : super(key: key);

  final String? state;
  final String? district;
  final String? resource;
  final bool? isVerified;
  final ctrl = Get.put(SearchPageViewModel());
  @override
  Widget build(BuildContext context) {
    if (resource != null) {
      ctrl.resource.value = resource!;
      ctrl.place.value = '$state, $district';
      ctrl.verified.value = isVerified!;
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SearchAppBar(),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                title: Text('Row $index'),
              );
            }),
          )
        ],
      ),
    );
  }
}

CovidResources parseCovidResources(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<String, dynamic>();
  return CovidResources.fromJson(parsed as Map<String, dynamic>);
}

Future<CovidResources?> fetchResources(
    String _state, String _district, String _resource) async {
  final String _formattedDistrict = formatToUrlString(_district);
  final String _formattedResource = formatToUrlString(_resource);
  final String _formattedState = formatToUrlString(_state);
  try {
    final response = await Dio().get(
        'https://life-pipeline.coronasafe.network/api/resources?resource=$_formattedResource&state=$_formattedState&district=$_formattedDistrict');

    if (response.statusCode == 200) {
      return parseCovidResources(response.toString());
    } else {
      print('${response.statusCode}');
    }
  } catch (error) {
    print(error);
  }
  return null;
}

String formatToUrlString(String strToConvert) {
  return strToConvert.toLowerCase().replaceAll(' ', '_');
}
