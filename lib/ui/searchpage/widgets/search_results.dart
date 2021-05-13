import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/lottie_loading.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_card.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_error.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_not_found.dart';

class SearchResults extends GetView<SearchPageViewModel> {
  SearchResults({
    Key? key,
  }) : super(key: key);

  final SearchPageViewModel ctrl = Get.find<SearchPageViewModel>();

  final _listViewPadding =
      EdgeInsets.only(top: 25, bottom: 10, left: 5, right: 5);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: controller.obx((state) {
      if (state!.resources.isNotEmpty) {
        final resources = state.resources;
        if (ctrl.verified()) {
          resources.removeWhere(
              (element) => !element.verificationStatus.contains('verified'));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: resources.length,
          padding: _listViewPadding,
          itemBuilder: (BuildContext context, int index) {
            return ResourceCard(resource: resources[index]);
          },
        );
      } else {
        return ResourceNotFound();
      }
    }, onLoading: LottieLoading(), onError: (err) => ResourceError()));
  }
}
