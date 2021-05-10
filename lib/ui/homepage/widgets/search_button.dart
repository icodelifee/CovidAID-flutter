import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Color(0xFF34C759),
      onPressed: () {
        final state = Get.find<HomePageViewModel>();
        if (state.placeCtrl.text == '') {
          Get.snackbar('Error', 'Please select a district!',
              snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
        } else if (state.resource() == '') {
          Get.snackbar('Error', 'Please select a resource!',
              snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
        } else {
          final split = state.placeCtrl.text.split(',');
          Get.to(SearchPage(
            district: split[0],
            state: split[1],
            isVerified: state.verified(),
            resource: state.resource(),
          ));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('SEARCH',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Gap(10),
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
