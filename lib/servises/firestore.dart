import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:projet_2cp/classes/Alerte.dart';
import 'package:projet_2cp/classes/Utilisateur.dart';

class FirestoreService{

  final Firestore _firestore = Firestore.instance;
  Future getUserDoc(String id) async
  {
    //_firestore.collection("users").document(id).get().then(onValue);
  }

  Future createGroup(String nom/*members,admin,type*/) async
  {
    DocumentReference groupDoc = await _firestore.collection("books")
        .add({
      //'title': 'Flutter in Action',
      //'description': 'Complete Programming Guide to learn Flutter'
    });
    print(groupDoc.documentID);
  }
}