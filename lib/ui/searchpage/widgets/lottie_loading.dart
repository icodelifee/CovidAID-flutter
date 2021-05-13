import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget {
  LottieLoading({
    Key? key,
  }) : super(key: key);

  final lottieAssets = [
    'assets/lottie/hand-wash.json',
    'assets/lottie/sanitizer.json',
    'assets/lottie/spray.json',
    'assets/lottie/wipe.json'
  ];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Lottie.asset(lottieAssets[_random.nextInt(lottieAssets.length)]));
  }
}
