import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceLinkButton extends StatelessWidget {
  const SourceLinkButton({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final CovidResourceModel resource;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: BoxConstraints(minWidth: 10),
        padding: EdgeInsets.zero,
        icon: Icon(Icons.link_rounded),
        onPressed: () async {
          if (resource.sourceLink.isNotEmpty) {
            if (!resource.sourceLink.contains('http')) {
              launch('http://${resource.sourceLink}');
            } else {
              launch(resource.sourceLink);
            }
          } else {
            Get.rawSnackbar(
                duration: Duration(milliseconds: 900),
                title: 'Error',
                message: 'Source link does not exist for this resource');
          }
        });
  }
}
