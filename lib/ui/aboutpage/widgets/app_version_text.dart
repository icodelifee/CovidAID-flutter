import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info/package_info.dart';

class AppVersionText extends StatelessWidget {
  const AppVersionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? Text('v${snapshot.data!.version}-${snapshot.data!.buildNumber}',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    height: 0.6,
                    fontSize: Get.width * 0.049))
            : SizedBox();
      },
    );
  }
}
