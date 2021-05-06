import 'package:flutter/material.dart';
import 'NotificationTileView.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  final dummyData = [
    {'resource': 'OXYGEN', 'state': 'Hyderabad', 'city': 'Telangana', 'active': true},
    {'resource': 'HOSPITAL', 'state': 'KERALA', 'city': 'KOCHI', 'active': false},
    {'resource': 'MEDICINE', 'state': 'KERALA', 'city': 'KOCHI', 'active': true},
    {'resource': 'AMBULANCE', 'state': 'KERALA', 'city': 'KOCHI', 'active': true},
    {'resource': 'OXYGEN', 'state': 'KERALA', 'city': 'KOCHI', 'active': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Notification Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating Action Button');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index){
          final data = dummyData[index];
          return NotificationTile(data: data,);
        },
      ),
      // body: ListView(
      //   children: [
      //     NotificationTile(),
      //     NotificationTile(),
      //     NotificationTile(),
      //     NotificationTile(),
      //     NotificationTile(),
      //     NotificationTile(),
      //   ],
      // ),
    );
  }
}
