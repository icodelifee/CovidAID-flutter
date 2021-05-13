import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/models/covid_resource_model.dart';

class ResourceTitle extends StatelessWidget {
  const ResourceTitle({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final CovidResourceModel resource;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            resource.title,
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        if (resource.verificationStatus.toLowerCase().contains('verified'))
          Image.asset(
            'assets/images/check.png',
            width: 20,
          )
        else
          SizedBox()
      ],
    );
  }
}
