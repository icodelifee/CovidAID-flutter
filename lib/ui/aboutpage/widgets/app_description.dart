import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDescription extends StatelessWidget {
  const AppDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ExpandText('''
While coronavirus pandemic rapidly resulting in global crisis threatening lives of millions of people. As of today, many people are getting deprived from the provisions provided by the government due to increase of infectious people to million every day.
\nIn continuation to initiation taken by Kerala government to provide verified information related to COVID relief resources availability, COVIDAID takes measures to provide verified content via mobile app by using open source verified database.\n
COVIDAID shows user verified covid relief resources with simple search of state, city and resource, where they can find availability of covid relief resource. if resources not available at that particular time they can subscribe for an alert.''',
            maxLines: 4,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600])));
  }
}
