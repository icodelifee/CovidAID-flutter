import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResourceNotFound extends StatelessWidget {
  const ResourceNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(20),
        LottieBuilder.asset(
          'assets/lottie/cant-find.json',
          alignment: Alignment.topCenter,
          width: Get.width / 2,
          frameRate: FrameRate.max,
        ),
        Text(
          // ignore: unnecessary_string_escapes
          "Couldn\'t Find Any Resources!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
