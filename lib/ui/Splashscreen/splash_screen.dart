import 'package:flutter/material.dart';
import 'package:lifecoronasafe/ui/Splashscreen/Widgets/life_logo.dart';
import 'package:lifecoronasafe/ui/Splashscreen/Widgets/powered-by_loog.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          LifeLogo(),
          PoweredByLogo(),
        ]),
      ),
    );
  }
}
