import 'package:flutter/material.dart';
import 'package:lifecoronasafe/ui/Splashscreen/Widgets/life_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          LifeLogo(),
        ]),
      ),
    );
  }
}
