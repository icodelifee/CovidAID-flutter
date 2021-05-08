import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/homepage_carousel.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/place_textfield.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/resource_selector.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/search_button.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/verified_switch.dart';

class HomePage extends StatelessWidget {
  final placeCtrl = TextEditingController();
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
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            HomePageCarousel(),
            Gap(20),
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlaceTextField(placeCtrl: placeCtrl),
                  Gap(15),
                  ResourceSelector(),
                  Gap(15),
                  VerifiedSwitch()
                ],
              ),
            ),
            Gap(30),
            SearchButton(placeCtrl: placeCtrl)
          ],
        ),
      ),
    );
  }
}
