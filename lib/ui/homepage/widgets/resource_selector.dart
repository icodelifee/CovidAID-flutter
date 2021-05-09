import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';

class ResourceSelector extends GetView<ResourcesController> {
  ResourceSelector({
    Key? key,
  }) : super(key: key);
  final hstate = Get.find<HomePageViewModel>();
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => DropdownButtonFormField(
              isExpanded: true,
              onChanged: (String? val) {
                hstate.resource.value = val!;
              },
              hint: Text('Select Resource'),
              decoration: AppTheme.inputDecoration(''),
              items: state!
                  .map((e) => DropdownMenuItem<String>(
                        value: e.url,
                        child: Text(e.name!.capitalizeFirst!),
                      ))
                  .toList(),
            ),
        onError: (err) => SizedBox(),
        onLoading: SizedBox());
  }
}
