import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';

class SearchVerified extends StatelessWidget {
  SearchVerified({
    Key? key,
  }) : super(key: key);

  final ctrl = Get.find<SearchPageViewModel>();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(() => CupertinoFormRow(
            prefix: Text(
              'Verified',
              style: GoogleFonts.poppins(),
            ),
            child: CupertinoSwitch(
              value: ctrl.verified(),
              onChanged: (value) {
                ctrl.verified.value = value;
                ctrl.searchResource();
              },
            ),
          )),
    );
  }
}
