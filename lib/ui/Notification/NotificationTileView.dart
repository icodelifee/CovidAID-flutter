import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/models/NotificationQueries.dart';

class NotificationTile extends StatefulWidget {
  Map<String, dynamic> data;
  NotificationTile({required this.data});
  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  late NotificationQueriesModel data;
  @override
  void initState() {
    data = NotificationQueriesModel.fromJson(widget.data);
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
                    data.resource.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Gap(5),
                Container(
                    width: Get.width / 2,
                    child: Text(
                      '${data.district.toUpperCase()}, ${data.state.toUpperCase()}',
                      maxLines: 3,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                CupertinoSwitch(
                  value: data.active,
                  onChanged: (bool value) async {
                      // Get.snackbar(
                      //   "title",
                      //   "content",
                      // );
                    setState((){
                      data.active = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
