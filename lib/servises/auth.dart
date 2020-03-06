import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_2cp/classes/Utilisateur.dart';

class ServicesAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInEmail (String email,String password) async
  {
      try {
        AuthResult result = await _auth.signInWithEmailAndPassword(email : email, password : password);
        FirebaseUser user = result.user;
        return user;
      }
      catch (e) {
        print(e.toString());
        return null;
      }
  }

  Future registerEmail (String email,String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Creer un utilisateur
  Utilisateur _utilApp (FirebaseUser user)
  {

  }

}