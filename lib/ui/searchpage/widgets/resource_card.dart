import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_phone.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/resource_title.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/share_button.dart';
import 'package:lifecoronasafe/ui/searchpage/widgets/source_link_button.dart';
import 'package:get/utils.dart';

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
            ResourceTitle(resource: resource),
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
                ResourcePhone(resource: resource),
                Wrap(
                  spacing: 10,
                  children: [
                    ShareButton(resource: resource),
                    Gap(10),
                    SourceLinkButton(resource: resource),
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
