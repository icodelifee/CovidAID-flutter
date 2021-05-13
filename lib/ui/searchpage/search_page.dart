import 'dart:math';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_error.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_not_found.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    Key? key,
    this.state,
    this.district,
    this.resource,
    this.isVerified,
  }) : super(key: key);

  final String? state;
  final String? district;
  final String? resource;
  final bool? isVerified;
  final lottieAssets = [
    'assets/lottie/hand-wash.json',
    'assets/lottie/sanitizer.json',
    'assets/lottie/spray.json',
    'assets/lottie/wipe.json'
  ];
  final ctrl = Get.put(SearchPageViewModel());
  @override
  Widget build(BuildContext context) {
    if (resource != null) {
      ctrl.resource.value = resource!;
      ctrl.state.value = state!.trim();
      ctrl.district.value = district!.trim();
      ctrl.verified.value = isVerified!;
      ctrl.searchResource();
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SearchAppBar(),
          SliverFillRemaining(
            child: Obx(
              () => FutureBuilder<CovidResources?>(
                future: ctrl.resourcesFuture.value,
                builder: (BuildContext context,
                    AsyncSnapshot<CovidResources?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data!.resources.isNotEmpty) {
                      final resources = snapshot.data!.resources;
                      if (ctrl.verified()) {
                        resources.removeWhere((element) =>
                            !element.verificationStatus.contains('verified'));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: resources.length,
                        padding: EdgeInsets.only(
                            top: 25, bottom: 10, left: 5, right: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          resources[index].title,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      if (resources[index]
                                          .verificationStatus
                                          .toLowerCase()
                                          .contains('verified'))
                                        Image.asset(
                                          'assets/images/check.png',
                                          width: 20,
                                        )
                                      else
                                        SizedBox()
                                    ],
                                  ),
                                  Gap(10),
                                  ...resources[index].description.isNotEmpty
                                      ? [
                                          ExpandText(
                                            resources[index].description,
                                            maxLines: 1,
                                          ),
                                        ]
                                      : [],
                                  Divider(),
                                  Gap(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        spacing: 10,
                                        children: [
                                          IconButton(
                                              constraints:
                                                  BoxConstraints(minWidth: 10),
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.phone_outlined),
                                              onPressed: () {
                                                launch(
                                                    'tel:${resources[index].phone1}');
                                              }),
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text:
                                                      resources[index].phone1));
                                              Get.rawSnackbar(
                                                  title:
                                                      'Phone number copied to clipboard',
                                                  message: ' ');
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 2),
                                              child: Text(
                                                resources[index].phone1,
                                                style: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Wrap(
                                        spacing: 10,
                                        children: [
                                          IconButton(
                                              constraints:
                                                  BoxConstraints(minWidth: 10),
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.share_outlined),
                                              onPressed: () {
                                                final res = resources[index];
                                                String shareString = res.title;

                                                if (res
                                                    .description.isNotEmpty) {
                                                  shareString +=
                                                      '\n\n${resources[index].description}';
                                                }
                                                if (res.phone1.isNotEmpty) {
                                                  shareString +=
                                                      '\n\n${resources[index].phone1}';
                                                }
                                                if (res.sourceLink.isNotEmpty) {
                                                  shareString +=
                                                      '\n\n${resources[index].sourceLink}';
                                                }
                                                Share.share(shareString);
                                              }),
                                          Gap(10),
                                          IconButton(
                                              constraints:
                                                  BoxConstraints(minWidth: 10),
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.link_rounded),
                                              onPressed: () {}),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ).paddingSymmetric(horizontal: 20, vertical: 20),
                            ),
                          );
                        },
                      );
                    } else {
                      return ResourceNotFound();
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: Lottie.asset(
                          lottieAssets[Random().nextInt(lottieAssets.length)]),
                    );
                  } else {
                    return ResourceError();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
