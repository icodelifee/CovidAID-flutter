import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed('/notification_settings');
              },
              child: const Text('Notification Settings'),
            )
          ],
        ),
      ),
    );
  }
}
