import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifecoronasafe/firebase/firestore_db.dart';
import 'package:lifecoronasafe/models/covid_resource_model.dart';

class FireStorePage extends StatefulWidget {
  @override
  _FireStorePageState createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference data =
        FireStoreDb.fireStoreInstance.collection('data');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Oxygen'),
      ),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: data.doc('oxygen').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Center(child: Text('Document does not exist'));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final Map<String, dynamic> data = snapshot.data!.data()!;
              final CovidResources resourceList = CovidResources.fromJson(data);
              return ListView.builder(
                itemCount: resourceList.resources.length,
                itemBuilder: (context, index) {
                  final resource = resourceList.resources[index];
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          resource.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(resource.description),
                        leading: Column(
                          children: [
                            const Icon(
                              Icons.arrow_drop_up_outlined,
                              size: 30,
                              color: Colors.green,
                            ),
                            Text(resource.upVotes),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              //return Text('$data');
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
