import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.placeCtrl,
  }) : super(key: key);

  final TextEditingController placeCtrl;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Color(0xFF34C759),
      onPressed: () => Get.to(() => SearchPage(
          // state: placeCtrl.text.split(',')[1],
          )),
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
