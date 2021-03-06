import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_resource_selector.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_textfield.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_verified.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      forceElevated: true,
      elevation: 3,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text(
        'Search Results',
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
      expandedHeight: 110,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(155),
        child: FlexibleSpaceBar(
            centerTitle: true,
            title: Container(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  children: [
                    SearchTextField(),
                    Gap(12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SearchResourceSelector(),
                        Gap(10),
                        SearchVerified()
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
