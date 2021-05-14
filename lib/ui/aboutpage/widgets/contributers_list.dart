import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifecoronasafe/data/firebase/firestore_db.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributersList extends StatelessWidget {
  const ContributersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreDb.fireStoreInstance
          .collection('data')
          .doc('contributers')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final doc = snapshot.data! as DocumentSnapshot;
          final contributers = doc.data()!['data'] as List;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: contributers.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => launch(contributers[index]['url'].toString()),
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage(contributers[index]['image'].toString()),
                ),
                title: Text(
                  contributers[index]['name'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('@${contributers[index]['uname']}'),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
