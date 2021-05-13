import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/lottie_loading.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_card.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_error.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_not_found.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_appbar.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_results.dart';

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
      ctrl.pstate.value = state!.trim();
      ctrl.district.value = district!.trim();
      ctrl.verified.value = isVerified!;
      ctrl.searchResource();
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SearchAppBar(),
          SearchResults(),
        ],
      ),
    );
  }
}
