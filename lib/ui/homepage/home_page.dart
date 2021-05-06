import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_active_outlined),
              onPressed: () {})
        ],
      ),
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField(
                    isExpanded: true,
                    hint: Text('Select State'),
                    decoration: AppTheme.inputDecoration(''),
                    items: [],
                  ),
                  Gap(15),
                  DropdownButtonFormField(
                    isExpanded: true,
                    hint: Text('Select District'),
                    decoration: AppTheme.inputDecoration(''),
                    items: [],
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 2.1,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          hint: Text('Select Resource'),
                          decoration: AppTheme.inputDecoration(''),
                          items: [],
                        ),
                      ),
                      SizedBox(
                          width: Get.width / 2.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Verified',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Checkbox(value: false, onChanged: (val) {})
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
