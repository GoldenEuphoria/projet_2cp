
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_2cp/servises/auth.dart';

class Connection extends StatefulWidget {
  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  String email = 'yasminebenhamadi05@gmail.com';
  String password = '123';
  final ServicesAuth _authService = ServicesAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('sign in with email and password'),
      ),
      body: Container(
        child : RaisedButton(
            child: Text('Sign in'),
            onPressed: () async {
              dynamic result = await _authService.signInEmail(email, password);
              if (result == null)
                print('Sign in failed');
            }
        ),
      ),

    );
  }
}