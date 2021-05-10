import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageCarousel extends StatelessWidget {
  HomePageCarousel({
    Key? key,
  }) : super(key: key);

  final _carouselOptions =
      CarouselOptions(height: 200.0, viewportFraction: 1, autoPlay: true);
  final _carouselInfoList = <Map<String, dynamic>>[
    {
      'info': 'USE\nSANITIZER',
      'image': 'assets/images/sanitizer.png',
      'color': Color(0xFF43D675)
    },
    {
      'info': 'MAINTAIN\nSOCIAL\nDISTANCING',
      'image': 'assets/images/social-distancing.png',
      'color': Color(0xFFD68143)
    },
    {
      'info': 'STAY HOME\nSTAY SAFE',
      'image': 'assets/images/stay-home.png',
      'color': Color(0xFF438FD6)
    },
    {
      'info': 'GET\nVACCINATED',
      'image': 'assets/images/syringe.png',
      'color': Color(0xFFD6436F)
    },
    {
      'info': 'WASH YOUR\nHANDS\nOFTEN',
      'color': Color(0xFF4349D6),
      'image': 'assets/images/wash-hands.png'
    },
    {
      'info': 'ALWAYS\nWEAR\nA MASK',
      'image': 'assets/images/wear-mask.png',
      'color': Color(0xFFD64343),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: _carouselOptions,
      items: _carouselInfoList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                padding: EdgeInsets.all(25),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2.3,
                      child: AutoSizeText(
                        i['info'].toString(),
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 19,
                        style: GoogleFonts.montserrat(
                            fontSize: 24,
                            letterSpacing: 0.2,
                            color: i['color'] as Color,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Image.asset(i['image'].toString(), width: Get.width / 3.5)
                  ],
                ));
          },
        );
      }).toList(),
    );
  }
}
