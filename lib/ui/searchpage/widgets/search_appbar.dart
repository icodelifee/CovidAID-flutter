import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.grey[200],
      title: Text(
        'Search Results',
        style: TextStyle(color: Colors.black),
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
                    Gap(9),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [SearchResourceSelector(), SearchVerified()],
                    )
                  ],
                ))),
      ),
    );
  }
}
