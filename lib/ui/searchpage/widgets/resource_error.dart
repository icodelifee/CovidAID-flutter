import 'package:flutter/material.dart';

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
