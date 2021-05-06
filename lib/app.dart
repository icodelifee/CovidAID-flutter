import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/firebase/firebase_authentication.dart';
import 'package:lifecoronasafe/ui/Splashscreen/splash_screen.dart' as splash;
import 'package:lifecoronasafe/ui/pages/home_page.dart';
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
    FirebaseAuthentication.signInAnonymously();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: transition,
      title: 'Life By Corona Safe',
      theme: themeData,
      getPages: _pages,
      home: SplashScreen.timed(
        route: MaterialPageRoute(builder: (_) => HomePage()),
        seconds: 3,
        body: Container(),
      ),
    );
  }
}
