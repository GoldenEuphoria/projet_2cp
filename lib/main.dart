import 'package:flutter/material.dart';
import 'package:projet_2cp/authentication/Authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate depending on the Firebase.Auth instance
    return Authentication ();
  }
}