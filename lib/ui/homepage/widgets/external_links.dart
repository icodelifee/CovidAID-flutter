import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExternalLinksWidget extends StatelessWidget {
  const ExternalLinksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: -10,
      children: [
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/life.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'liferesources',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFFB21936),
        ),
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/covidstats.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'COVID19 Statistics',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFF27AE60),
        ),
        Chip(
          backgroundColor: Color(0xFFEB5757),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/oxygen.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'Oxygen Concentration Requirements',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/fda.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'FDA Officers Contact',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFF2D9CDB),
        ),
        Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/github.png',
                width: 15,
              ),
              Gap(10),
              Text(
                'Github',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        )
      ],
    );
  }
}
