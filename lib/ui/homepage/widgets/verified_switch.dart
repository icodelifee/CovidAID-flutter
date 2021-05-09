import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';

class VerifiedSwitch extends StatelessWidget {
  VerifiedSwitch({
    Key? key,
  }) : super(key: key);
  final HomePageViewModel state = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Verified',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                  fontSize: 17),
            ),
            CupertinoSwitch(
                value: state.verified(),
                onChanged: (val) {
                  state.verified.value = val;
                }),
          ],
        ),
      ),
    );
  }
}
