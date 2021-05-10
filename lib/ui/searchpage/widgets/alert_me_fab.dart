import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
