import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerfiedSwitch extends StatelessWidget {
  const VerfiedSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Verified',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400, letterSpacing: 0.4, fontSize: 17),
          ),
          CupertinoSwitch(value: true, onChanged: (val) {}),
        ],
      ),
    );
  }
}
