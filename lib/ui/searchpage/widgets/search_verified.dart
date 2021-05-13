import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';

class SearchVerified extends StatelessWidget {
  SearchVerified({
    Key? key,
  }) : super(key: key);

  final ctrl = Get.find<SearchPageViewModel>();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => CheckboxListTile(
            title: Text('Verified'),
            value: ctrl.verified(),
            onChanged: (val) {
              ctrl.verified.value = val!;
              ctrl.searchResource();
            }),
      ),
    );
  }
}
