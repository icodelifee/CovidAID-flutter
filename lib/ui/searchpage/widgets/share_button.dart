import 'package:flutter/material.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final CovidResourceModel resource;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: BoxConstraints(minWidth: 10),
        padding: EdgeInsets.zero,
        icon: Icon(Icons.share_outlined),
        onPressed: () {
          final res = resource;
          String shareString = res.title;

          if (res.description.isNotEmpty) {
            shareString += '\n\n${resource.description}';
          }
          if (res.phone1.isNotEmpty) {
            shareString += '\n\n${resource.phone1}';
          }
          if (res.sourceLink.isNotEmpty) {
            shareString += '\n\n${resource.sourceLink}';
          }
          Share.share(shareString);
        });
  }
}
