import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoweredByLogo extends StatelessWidget {
  const PoweredByLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Powered by'),
          Image.asset(
            'assets/images/coronasafe.png',
            width: Get.width / 2,
          ),
        ],
      ),
    );
  }
}
