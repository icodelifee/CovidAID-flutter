import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/ui/Homepage/Homepage.dart';
// import 'package:lifecoronasafe/ui/Homepage/Homepage.dart';
import 'package:lifecoronasafe/ui/Splashscreen/Splashscreen.dart' as splash;
// ignore: import_of_legacy_library_into_null_safe
import 'package:your_splash/your_splash.dart';

class App extends StatelessWidget {
  final List<GetPage> _pages = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/splash', page: () => const splash.SplashScreen()),
  ];
  final ThemeData themeData =
      ThemeData(textTheme: GoogleFonts.poppinsTextTheme());
  final Transition transition = Transition.cupertino;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: transition,
      title: 'Life By Corona Safe',
      theme: themeData,
      getPages: _pages,
      home: SplashScreen.timed(
        route: MaterialPageRoute(builder: (_) => HomePage()),
        seconds: 3,
        body: HomePage(),
      ),
    );
  }
}
