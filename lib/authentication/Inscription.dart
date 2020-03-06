import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_2cp/servises/auth.dart';
//Inscription
class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
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
              dynamic result = await _authService.registerEmail(email, password);
              if (result == null)
                print('Registration failed');
            }
        ),
      ),

    );
  }
}