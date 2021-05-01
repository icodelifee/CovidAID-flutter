import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:lifecoronasafe/ui/Homepage/Homepage.dart';
import 'package:lifecoronasafe/ui/Splashscreen/Splashscreen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        title: 'Life By Corona Safe',
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: SplashScreen());
  }
}
