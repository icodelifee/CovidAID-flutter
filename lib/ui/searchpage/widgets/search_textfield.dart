import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';

class SearchTextField extends StatelessWidget {
  final state = Get.find<SearchPageViewModel>();
  final placesCtrl = Get.find<PlacesController>();
  final mappedPlacesCtrl = Get.find<MappedPlacesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: AppTheme.inputDecoration('Select State')
                .copyWith(fillColor: Colors.white),
            isExpanded: true,
            value: state.state(),
            onChanged: (String? newState) async {
              state.state.value = newState!;
              state.district.value =
                  (mappedPlacesCtrl.mappedPlaces[state.state.value] as List)
                      .first
                      .toString();
              state.searchResource();
            },
            items: mappedPlacesCtrl.mappedPlaces.keys.map((stateName) {
              return DropdownMenuItem<String>(
                value: stateName.toString(),
                child: Text(stateName.toString()),
              );
            }).toList(),
          ),
        ),
        Gap(10),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: AppTheme.inputDecoration('Select City')
                .copyWith(fillColor: Colors.white),
            isExpanded: true,
            value: state.district.value,
            onChanged: (String? newCity) async {
              state.district.value = newCity!;
              state.searchResource();
            },
            items: (mappedPlacesCtrl.mappedPlaces[state.state.value] as List)
                .map((cityName) {
              return DropdownMenuItem<String>(
                value: cityName.toString(),
                child: Text(cityName.toString()),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
