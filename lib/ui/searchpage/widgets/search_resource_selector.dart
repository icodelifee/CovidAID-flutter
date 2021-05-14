import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';

class SearchResourceSelector extends GetView<ResourcesController> {
  SearchResourceSelector({
    Key? key,
  }) : super(key: key);
  final ctrl = Get.find<SearchPageViewModel>();
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      if (ctrl.resource() == '') {
        ctrl.resource.value = state!.first.url!;
      }
      return Flexible(
        child: DropdownButtonFormField(
          onChanged: (String? val) {
            ctrl.resource.value = val!;
            ctrl.searchResource();
          },
          value: ctrl.resource(),
          hint: Text('Select Resource'),
          isExpanded: true,
          decoration: AppTheme.inputDecoration('')
              .copyWith(fillColor: Colors.grey[200]),
          items: state!
              .map((e) => DropdownMenuItem<String>(
                    value: e.url,
                    child: Text(e.name!.capitalizeFirst!),
                  ))
              .toList(),
        ),
      );
    }, onError: (err) => SizedBox(), onLoading: SizedBox());
  }
}
