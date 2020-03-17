import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_2cp/classes/Utilisateur.dart';

class ServicesAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future UserInfo()
  {

  }
  Future signInEmail(String email, String password) async
  {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerEmail(String email, String password, String nom, String prenom) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print('hello');
      FirebaseUser user = result.user;
      // set user's display name
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = prenom+' '+nom;
      user.updateProfile(updateInfo);
      return _utilApp(user, email, password, nom, prenom);
    }
    catch (e) {
      print(e.toString());
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          {

          }
          break;
        case "ERROR_WEAK_PASSWORD":
          {

          }
          break;
        default:
          {

          }
          return null;
      }
    }
  }
// Creer un utilisateur
  Utilisateur _utilApp (FirebaseUser user,String email,String password,String nom,String prenom) {
    return user != null
        ? Utilisateur(user.uid, email, password, nom, prenom)
        : null;
  }

}