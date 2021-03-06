import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/bindings/resources_binding.dart';
import 'package:lifecoronasafe/data/firebase/firebase_authentication.dart';
import 'package:lifecoronasafe/ui/Notification/NotificationSettings.dart';
import 'package:lifecoronasafe/ui/Splashscreen/splash_screen.dart' as splash;
import 'package:lifecoronasafe/ui/homepage/home_page.dart';

class App extends StatelessWidget {
  final List<GetPage> _pages = [
    GetPage(name: '/', page: () => HomePage(), binding: HomepageBinding()),
    GetPage(name: '/notification_settings', page: () => NotificationSettings()),
    GetPage(name: '/splash', page: () => const splash.SplashScreen()),
  ];
  final ThemeData themeData = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      accentIconTheme: IconThemeData(color: Color(0xFF34C759)),
      accentColor: const Color(0xFF34C759));
  final Transition transition = Transition.cupertino;

  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication.signInAnonymously();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: transition,
      title: 'covidresources',
      theme: themeData,
      getPages: _pages,
      initialRoute: '/',
    );
  }
}
