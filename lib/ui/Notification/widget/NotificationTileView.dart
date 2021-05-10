import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import 'package:lifecoronasafe/models/NotificationQueries.dart';

class NotificationTile extends StatefulWidget {
  final NotificationQueriesModel data;
  const NotificationTile({required this.data});
  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  late NotificationQueriesModel data;
  bool _updateLoading = false;
  @override
  void initState() {
    data = widget.data;
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
                SizedBox(
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
                SizedBox(
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
                if (_updateLoading)
                  const CircularProgressIndicator()
                else
                  CupertinoSwitch(
                    value: data.active,
                    onChanged: (bool value) async {
                      setState(() {
                        _updateLoading = true;
                      });
                      try {
                        final String result =
                            await FireStoreDb.updateNotificationSetting(
                          data.uid,
                          data.docid,
                          value,
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                        if (result == 'Update Success') {
                          setState(() {
                            data.active = value;
                          });
                        }
                      } catch (e) {
                        Get.snackbar(
                          e.toString(),
                          '',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } finally {
                        setState(() {
                          _updateLoading = false;
                        });
                      }
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
