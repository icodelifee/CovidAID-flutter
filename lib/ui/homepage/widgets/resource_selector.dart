import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';

class ResourceSelector extends GetView<ResourcesController> {
  const ResourceSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => DropdownButtonFormField(
              isExpanded: true,
              onChanged: (val) {},
              hint: Text('Select Resource'),
              decoration: AppTheme.inputDecoration(''),
              items: state!
                  .map((e) => DropdownMenuItem(
                        value: e.name,
                        child: Text(e.name!.capitalizeFirst!),
                      ))
                  .toList(),
            ),
        onError: (err) => SizedBox(),
        onLoading: SizedBox());
  }
}
