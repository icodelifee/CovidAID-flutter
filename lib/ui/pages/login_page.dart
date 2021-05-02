import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifecoronasafe/firebase/firebase_authentication.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Anonymous Login'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                FirebaseAuthentication.signInAnonymously();
                userLoginState(context);
              },
              child: const Text('Anonymous Sign in'),
            ),
          ],
        ),
      ),
    );
  }

  userLoginState(BuildContext context) {
    Text snackbarText;
    FirebaseAuthentication.firebaseAuthInstance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is not signed in!');
        snackbarText = const Text('User not signed in');
      } else {
        print('User is signed in!');
        try {
          snackbarText = Text('Signed in anonymously\n UID: ${user.uid}');
        } catch (e) {
          print(e);
          snackbarText = Text(e.toString());
        }
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: snackbarText));
    });
  }
}
