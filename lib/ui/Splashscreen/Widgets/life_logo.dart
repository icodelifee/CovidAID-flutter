import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LifeLogo extends StatelessWidget {
  const LifeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/life-filled.png',
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Text('LIFE',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 63)),
        Text(
          'Verified Crowd Sourced\nEmergency Services Directory',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Gap(50),
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFF44B679)),
          ),
        )
      ],
    );
  }
}
