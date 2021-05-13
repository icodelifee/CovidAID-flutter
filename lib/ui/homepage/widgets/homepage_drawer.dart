import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Get.theme.accentColor,
            ),
            child: SizedBox(
              width: Get.width,
              child: Text('COVID AID +',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white)),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('External Links',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    )),
                Gap(10),
                Icon(Icons.link)
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/life.png',
                  width: 25,
                  color: Colors.black,
                ),
                Gap(20),
                Text(
                  'Life Resources',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/covidstats.png',
                  width: 25,
                  color: Colors.black,
                ),
                Gap(20),
                Text(
                  'COVID-19 Statistics',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/oxygen.png',
                  width: 25,
                  color: Colors.black,
                ),
                Gap(20),
                Flexible(
                  child: Text(
                    'Oxygen Concentration Requirements',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/fda.png',
                  width: 25,
                  color: Colors.black,
                ),
                Gap(20),
                Flexible(
                  child: Text(
                    'FDA Officers Contact',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/github.png',
                  width: 30,
                  color: Colors.black,
                ),
                Gap(20),
                Flexible(
                  child: Text(
                    'Github',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    thickness: 0.5,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info_outline),
                        Gap(20),
                        Flexible(
                          child: Text(
                            'About App',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
