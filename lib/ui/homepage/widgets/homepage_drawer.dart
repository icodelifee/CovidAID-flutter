import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/aboutpage/about_page.dart';
import 'package:lifecoronasafe/ui/homepage/widgets/external_links_tile.dart';

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
                      fontSize: 16,
                    )),
                Gap(10),
                Icon(Icons.link)
              ],
            ),
          ),
          ExternalLinksTile(
            url: 'https://life.coronasafe.network/',
            title: 'Life Resources',
            asset: 'life',
          ),
          ExternalLinksTile(
            url: 'https://www.covid19india.org/',
            title: 'COVID-19 Statistics',
            asset: 'covidstats',
          ),
          ExternalLinksTile(
            url:
                'https://charts.mongodb.com/charts-swasth-deman-data-aobsf/public/dashboards/608a951e-5a65-4419-843d-d193674b3673',
            title: 'Oxygen Concentration Requirements',
            asset: 'oxygen',
          ),
          ExternalLinksTile(
            url:
                'https://docs.google.com/spreadsheets/d/1BEXdf68gxsYsp3Hsc0gUEPbH_wx0kSbu/edit#gid=438108583',
            title: 'FDA Officers Contact',
            asset: 'fda',
          ),
          ExternalLinksTile(
            url: 'https://github.com/icodelifee/CovidAID-flutter',
            title: 'Source Code',
            asset: 'github',
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
                    onTap: () => Get.to(() => AboutPage()),
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
