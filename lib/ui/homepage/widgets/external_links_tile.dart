import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinksTile extends StatelessWidget {
  const ExternalLinksTile({
    required this.url,
    required this.asset,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String url;
  final String asset;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => launch(url),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/$asset.png',
            width: 25,
            color: Colors.black,
          ),
          Gap(20),
          Flexible(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
