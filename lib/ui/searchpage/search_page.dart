import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_appbar.dart';

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
      ctrl.place.value = '$district, $state';
      ctrl.verified.value = isVerified!;
      ctrl.searchResource();
    }
    return Scaffold(
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
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: resources.length,
                        padding: EdgeInsets.only(top: 35, bottom: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    resources[index].title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    resources[index].address,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
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
                    return Center(child: CircularProgressIndicator());
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

class ResourceError extends StatelessWidget {
  const ResourceError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Some error occured! Please try again later.',
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }
}

class ResourceNotFound extends StatelessWidget {
  const ResourceNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Resources not found!',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
