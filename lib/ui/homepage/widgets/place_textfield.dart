import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';

class PlaceTextField extends StatelessWidget {
  PlaceTextField({
    Key? key,
  }) : super(key: key);

  final APIRepository repo = APIRepositoryImpl();
  final state = Get.find<HomePageViewModel>();
  final placesCtrl = Get.find<PlacesController>();
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          decoration:
              AppTheme.inputDecoration('Enter place to search resources..')
                  .copyWith(
                      suffixIcon: IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(Icons.close, color: Get.theme.accentColor),
            onPressed: () {
              textEditingController.clear();
            },
          )),
          focusNode: focusNode,
        );
      },
      optionsViewBuilder: (context, onAutoCompleteSelect, options) {
        return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        onTap: () =>
                            onAutoCompleteSelect(options.elementAt(index)),
                        title: Text(options.elementAt(index).toString()),
                      );
                    },
                  )),
            ));
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return placesCtrl.places.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        state.placeCtrl.text = selection;
      },
    );
  }
}
