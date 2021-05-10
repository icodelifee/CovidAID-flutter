import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/homepage/home_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page_viewmodel.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/search_textfield.dart';

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
  final placeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (resource != null) {
      ctrl.resource.value = resource!;
      placeCtrl.text = '$state, $district';
      ctrl.verified.value = isVerified!;
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.grey[200],
            title: Text(
              'Search Results',
              style: TextStyle(color: Colors.black),
            ),
            expandedHeight: 130,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(170),
              child: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          SearchTextField(placeCtrl: placeCtrl),
                          Gap(9),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SearchResourceSelector(),
                              SearchVerified()
                            ],
                          )
                        ],
                      ))),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                title: Text('Row $index'),
              );
            }),
          )
        ],
      ),
    );
  }
}

class SearchVerified extends StatelessWidget {
  SearchVerified({
    Key? key,
  }) : super(key: key);

  final ctrl = Get.find<SearchPageViewModel>();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => CheckboxListTile(
            title: Text('Verified'),
            value: ctrl.verified(),
            onChanged: (val) {
              ctrl.verified.value = val!;
            }),
      ),
    );
  }
}

class SearchResourceSelector extends GetView<ResourcesController> {
  SearchResourceSelector({
    Key? key,
  }) : super(key: key);
  final ctrl = Get.find<SearchPageViewModel>();
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      if (ctrl.resource() == '') {
        ctrl.resource.value = state!.first.url!;
      }
      return Flexible(
        child: DropdownButtonFormField(
          onChanged: (String? val) {
            ctrl.resource.value = val!;
          },
          value: ctrl.resource(),
          hint: Text('Select Resource'),
          decoration:
              AppTheme.inputDecoration('').copyWith(fillColor: Colors.white),
          items: state!
              .map((e) => DropdownMenuItem<String>(
                    value: e.url,
                    child: Text(e.name!.capitalizeFirst!),
                  ))
              .toList(),
        ),
      );
    }, onError: (err) => SizedBox(), onLoading: SizedBox());
  }
}

class AlertMeFAB extends StatelessWidget {
  const AlertMeFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Row(
        children: [
          Text(
            'Alert Me',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gap(8),
          Icon(Icons.notifications_active_outlined)
        ],
      ),
      backgroundColor: Color(0xFF34C759),
    );
  }
}
