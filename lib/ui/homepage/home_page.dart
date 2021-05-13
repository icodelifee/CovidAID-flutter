import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/homepage_carousel.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/homepage_disclaimer.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/homepage_drawer.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/place_textfield.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/resource_selector.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/search_button.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/verified_switch.dart';

class HomePage extends StatelessWidget {
  final state = Get.put(HomePageViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                icon: const Icon(Icons.notifications_active_outlined),
                onPressed: () => Get.toNamed('/notification_settings'))
          ],
        ),
        drawer: HomePageDrawer(),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HomePageCarousel(),
                  Gap(20),
                  PlaceTextField(),
                  Gap(15),
                  ResourceSelector(),
                  Gap(15),
                  VerifiedSwitch(),
                  Gap(10),
                  SearchButton(),
                  Gap(20),
                  Gap(10),
                  HomePageDisclaimer(),
                ],
              ),
            ),
          );
        }));
  }
}
