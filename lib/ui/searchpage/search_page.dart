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

  final ctrl = Get.put(SearchPageViewModel());

  @override
  Widget build(BuildContext context) {
    if (resource != null) {
      ctrl.resource.value = resource!;
      ctrl.pstate.value = state!.trim();
      ctrl.district.value = district!.trim();
      ctrl.verified.value = isVerified!;
      ctrl.searchResource();
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SearchAppBar(),
          SearchResults(),
        ],
      ),
    );
  }
}

class SearchResults extends GetView<SearchPageViewModel> {
  SearchResults({
    Key? key,
  }) : super(key: key);

  final SearchPageViewModel ctrl = Get.find<SearchPageViewModel>();

  final _listViewPadding =
      EdgeInsets.only(top: 25, bottom: 10, left: 5, right: 5);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: controller.obx((state) {
      if (state!.resources.isNotEmpty) {
        final resources = state.resources;
        if (ctrl.verified()) {
          resources.removeWhere(
              (element) => !element.verificationStatus.contains('verified'));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: resources.length,
          padding: _listViewPadding,
          itemBuilder: (BuildContext context, int index) {
            return ResourceCard(resource: resources[index]);
          },
        );
      } else {
        return ResourceNotFound();
      }
    }, onLoading: LottieLoading(), onError: (err) => ResourceError()));
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Lottie.asset(lottieAssets[Random().nextInt(lottieAssets.length)]));
  }
}

class ResourceCard extends StatelessWidget {
  ResourceCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final _cardPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 2);
  final CovidResourceModel resource;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _cardPadding,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    resource.title,
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
                if (resource.verificationStatus
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
            ...resource.description.isNotEmpty
                ? [
                    ExpandText(
                      resource.description,
                      maxLines: 1,
                    ),
                  ]
                : [],
            Divider(),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    IconButton(
                        constraints: BoxConstraints(minWidth: 10),
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.phone_outlined),
                        onPressed: () {
                          launch('tel:${resource.phone1}');
                        }),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: resource.phone1));
                        Get.rawSnackbar(
                            title: 'Phone number copied to clipboard',
                            message: ' ');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, top: 2),
                        child: Text(
                          resource.phone1,
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    IconButton(
                        constraints: BoxConstraints(minWidth: 10),
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.share_outlined),
                        onPressed: () {
                          final res = resource;
                          String shareString = res.title;

                          if (res.description.isNotEmpty) {
                            shareString += '\n\n${resource.description}';
                          }
                          if (res.phone1.isNotEmpty) {
                            shareString += '\n\n${resource.phone1}';
                          }
                          if (res.sourceLink.isNotEmpty) {
                            shareString += '\n\n${resource.sourceLink}';
                          }
                          Share.share(shareString);
                        }),
                    Gap(10),
                    IconButton(
                        constraints: BoxConstraints(minWidth: 10),
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.link_rounded),
                        onPressed: () async {
                          if (resource.sourceLink.isNotEmpty) {
                            if (!resource.sourceLink.contains('http')) {
                              launch('http://${resource.sourceLink}');
                            } else {
                              launch(resource.sourceLink);
                            }
                          } else {
                            Get.rawSnackbar(
                                duration: Duration(milliseconds: 900),
                                title: 'Error',
                                message:
                                    'Source link does not exist for this resource');
                          }
                        }),
                  ],
                )
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 20),
      ),
    );
  }
}
