import 'package:flutter/material.dart';
import 'package:lifecoronasafe/firebase/firebase_authentication.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication.observeUserAuthState(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(),
      ),
    );
  }
}
