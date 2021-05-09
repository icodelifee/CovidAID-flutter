import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/homepage_carousel.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/place_textfield.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/resource_selector.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/search_button.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/verified_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final placeCtrl = TextEditingController();
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
                icon: Icon(Icons.wb_sunny),
                onPressed: () {
                  Get.changeThemeMode(ThemeMode.dark);
                }),
            IconButton(
                icon: const Icon(Icons.notifications_active_outlined),
                onPressed: () => Get.toNamed('/notification_settings'))
          ],
        ),
        drawer: const Drawer(),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HomePageCarousel(),
                  Gap(20),
                  PlaceTextField(placeCtrl: placeCtrl),
                  Gap(15),
                  ResourceSelector(),
                  Gap(15),
                  VerifiedSwitch(),
                  Gap(10),
                  SearchButton(placeCtrl: placeCtrl),
                  Gap(20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'External Links',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Gap(5),
                      Icon(Icons.link)
                    ],
                  ),
                  ExternalLinksWidget(),
                  Gap(10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: Get.textTheme.bodyText1,
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Disclaimer: Data is not owned or created by us\n',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, fontSize: 13),
                          ),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => launch(
                                    'https://life.coronasafe.network/disclaimer'),
                              text: 'Know more',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.green,
                                  decoration: TextDecoration.underline)),
                        ]),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

class ExternalLinksWidget extends StatelessWidget {
  const ExternalLinksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: -10,
      children: [
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/life.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'liferesources',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFFB21936),
        ),
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/covidstats.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'COVID19 Statistics',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFF27AE60),
        ),
        Chip(
          backgroundColor: Color(0xFFEB5757),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/oxygen.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'Oxygen Concentration Requirements',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/fda.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'FDA Officers Contact',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFF2D9CDB),
        ),
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/github.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'Github',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        )
      ],
    );
  }
}
