import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatefulWidget {
  dynamic data;
  NotificationTile({required this.data});

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _switchValue = true;
  @override
  void initState() {
    // TODO: implement initState
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      color: Colors.grey[100],
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width / 2,
                  child: Text(
                    widget.data['resource'].toString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Gap(5),
                Container(
                    width: Get.width / 2,
                    child: Text(
                      '${widget.data['city'].toString().toUpperCase()}, ${widget.data['state'].toString().toUpperCase()}',
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                CupertinoSwitch(
                  value: widget.data['active'] == true ? true : false,
                  onChanged: (bool value) {
                    setState(() {
                      widget.data['active'] = value;
                    });
                  },
                ),
                // Switch(
                //   value: false,
                //   onChanged: (value) {
                //     print(value);
                //   },
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
