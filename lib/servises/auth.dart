//import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_2cp/classes/Utilisateur.dart';
import 'package:projet_2cp/servises/firestore.dart';

class ServicesAuth {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _db = FirestoreService();

  Future<Utilisateur> signInEmail(String email, String password) async
  {
    try {
     /* AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password); //Sign in with email and password
      FirebaseUser user = result.user; // Put the result in a objectwith the type : FirebaseUser
      String uid = user.uid;
      _db.getUserDoc(uid); // Get user's info*/
      //create an object Utilisateur
      return //user;
             null ;
    }
    catch (e) {
      //More detils about the error
      print(e.toString());
      return null;
    }
  }

  Future<Utilisateur> registerEmail(String email, String password, String nom, String prenom) async {
    try {
      /*AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password); //Create new user
      FirebaseUser user = result.user;

      /*UserUpdateInfo updateInfo = UserUpdateInfo();// set user's
      updateInfo.displayName = prenom+' '+nom;     // display
      user.updateProfile(updateInfo);              // name*/
*/
      String uid = /*user.uid*/'111111111111';
      Utilisateur utilisateur =  uid != null
          ? Utilisateur.neww(uid, email, nom,password,prenom)
          : null;
      //_db.createUserDoc(utilisateur); // Create a firestore doc to save user's info
      return utilisateur; //Return an 'Utilisateur' object
    }
    catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          {
              print('EMAIL_ALREADY_IN_USE');
          }
          break;
        case "ERROR_WEAK_PASSWORD":
          {
            print('WEAK_PASSWORD');
          }
          break;
        default:
          {
            print('UKNOWN_ERROR');
          }
          return null;
      }
    }
  }
  void changePassword(String password) async
  {
   /* FirebaseUser user = await FirebaseAuth.instance.currentUser(); // Get current user
    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_){
      print('password changed');
    }).catchError((error){
      print(error.toString());
    });*/
  }
  Future<void> resetPassword(String email)async
  {
   // await _auth.sendPasswordResetEmail(email: email);
  }
}