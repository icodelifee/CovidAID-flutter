import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageDisclaimer extends StatelessWidget {
  const HomePageDisclaimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(style: Get.textTheme.bodyText1, children: <TextSpan>[
        TextSpan(
          text: 'Disclaimer: Data is not owned or created by us\n',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 13),
        ),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap =
                  () => launch('https://life.coronasafe.network/disclaimer'),
            text: 'Know more',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Colors.green,
                decoration: TextDecoration.underline)),
      ]),
    );
  }
}
