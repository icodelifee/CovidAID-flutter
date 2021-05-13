import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcePhone extends StatelessWidget {
  const ResourcePhone({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final CovidResourceModel resource;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        IconButton(
            constraints: BoxConstraints(minWidth: 10),
            padding: EdgeInsets.zero,
            icon: Icon(Icons.phone_outlined),
            onPressed: () {
              launch('tel:${resource.phone1}');
            }),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: resource.phone1));
            Get.rawSnackbar(
                title: 'Phone number copied to clipboard', message: ' ');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5, top: 2),
            child: Text(
              resource.phone1,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
