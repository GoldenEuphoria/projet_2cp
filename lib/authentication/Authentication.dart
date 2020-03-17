import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_2cp/authentication/Inscription.dart';

//Authentification
class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Inscription(),
    );//Container
  }
}




