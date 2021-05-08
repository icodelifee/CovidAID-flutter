import 'package:flutter/material.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';

class ResourceSelector extends StatelessWidget {
  const ResourceSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text('Select Resource'),
      decoration: AppTheme.inputDecoration(''),
      items: [],
    );
  }
}
