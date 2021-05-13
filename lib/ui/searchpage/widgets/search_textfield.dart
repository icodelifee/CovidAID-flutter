import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    super.initState();
  }

  final state = Get.find<SearchPageViewModel>();
  final placesCtrl = Get.find<PlacesController>();
  final mappedPlacesCtrl = Get.find<MappedPlacesController>();
  String _selectedState = 'Maharashtra';
  String _selectedCity = 'Nagpur';

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: DropdownButtonFormField<String>(
          decoration: AppTheme.inputDecoration('Select State')
              .copyWith(fillColor: Colors.white),
          isExpanded: true,
          value: _selectedState,
          onChanged: (String? newState) async {
            setState(() {
              _selectedState = newState!;
              _selectedCity =
                  (mappedPlacesCtrl.mappedPlaces[_selectedState] as List)
                      .first
                      .toString();
            });
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
          value: _selectedCity,
          onChanged: (String? newCity) async {
            setState(() {
              _selectedCity = newCity!;
            });
          },
          items: (mappedPlacesCtrl.mappedPlaces[_selectedState] as List)
              .map((cityName) {
            return DropdownMenuItem<String>(
              value: cityName.toString(),
              child: Text(cityName.toString()),
            );
          }).toList(),
        ),
      )
    ]);
  }
}
