import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';

class PlaceTextField extends StatelessWidget {
  PlaceTextField({
    Key? key,
    required this.placeCtrl,
  }) : super(key: key);

  final TextEditingController placeCtrl;
  final APIRepository repo = APIRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
          controller: placeCtrl,
          decoration: AppTheme.inputDecoration(
              'Enter State or District To Search Resources For')),
      suggestionsCallback: (pattern) async {
        return repo.getSearchResults(pattern);
      },
      noItemsFoundBuilder: (context) =>
          ListTile(title: Text('No district(s) found!')),
      loadingBuilder: (context) => SizedBox(),
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.location_city),
          title: Text(suggestion.toString()),
        );
      },
      hideSuggestionsOnKeyboardHide: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hideOnError: true,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      keepSuggestionsOnLoading: false,
      getImmediateSuggestions: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select a district';
        }
      },
      onSuggestionSelected: (suggestion) {
        placeCtrl.text = suggestion.toString();
      },
    );
  }
}
