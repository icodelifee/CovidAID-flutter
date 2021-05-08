import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(
      {Key? key,
      this.state,
      this.district,
      this.resource,
      this.isVerified,
      this.showAlerts})
      : super(key: key);
  final String? state;
  final String? district;
  final String? resource;
  final bool? isVerified;
  final bool? showAlerts;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double toolbarHeight = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Search Results',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            Text(
              'Alert Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gap(8),
            Icon(Icons.notifications_active_outlined)
          ],
        ),
        backgroundColor: Color(0xFF34C759),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.grey[200],
              floating: true,
              snap: true,
              flexibleSpace: CustomizableSpaceBar(
                builder: (context, scrollingRate) {
                  return AnimatedContainer(
                      duration: Duration(seconds: 2),
                      child: getAppBarWidget(scrollingRate));
                },
              ),
              expandedHeight: toolbarHeight,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    title: Text('LIST ITEM'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getAppBarWidget(double scroll) {
    if (scroll == 0) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2.3,
                    child: DropdownButtonFormField(
                      // isExpanded: true,
                      hint: Text('Select State'),
                      decoration: AppTheme.inputDecoration('')
                          .copyWith(fillColor: Colors.white),
                      items: [],
                    ),
                  ),
                  Gap(15),
                  SizedBox(
                    width: Get.width / 2.3,
                    child: DropdownButtonFormField(
                      // isExpanded: true,
                      hint: Text('Select District'),
                      decoration: AppTheme.inputDecoration('')
                          .copyWith(fillColor: Colors.white),
                      items: [],
                    ),
                  ),
                ],
              ),
              Gap(14),
              DropdownButtonFormField(
                isExpanded: true,
                hint: Text('Select Resource'),
                decoration: AppTheme.inputDecoration('')
                    .copyWith(fillColor: Colors.white),
                items: [],
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
