import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/aboutpage/widgets/app_description.dart';
import 'package:lifecoronasafe/ui/aboutpage/widgets/app_version_text.dart';
import 'package:lifecoronasafe/ui/aboutpage/widgets/contributers_list.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('About App',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/github.png'),
                size: 30,
              ),
              onPressed: () {
                launch('https://github.com/icodelifee/CovidAID-flutter');
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(children: [
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: Get.width / 3.3,
              ),
              Gap(20),
              Text('COVIDAID',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w900,
                      fontSize: Get.width * 0.089)),
              Gap(7),
              AppVersionText(),
            ],
          )),
          Gap(Get.height * 0.05),
          AppDescription(),
          Gap(Get.height * 0.025),
          Center(
            child: Text(
              'Powered By',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 80.0,
              autoPlay: true,
              viewportFraction: 1,
            ),
            items: [
              'assets/images/flutter-india.png',
              'assets/images/gdg.png',
              'assets/images/coronasafe.png',
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width / 1.9,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Image.asset(
                        i,
                      ));
                },
              );
            }).toList(),
          ),
          Gap(Get.width * 0.05),
          Text('Contributers',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, fontSize: 20)),
          Divider(),
          ContributersList()
        ]),
      ),
    );
  }
}
