import 'package:location/location.dart';
import 'package:projet_2cp/classes/Groupe.dart';
import 'package:projet_2cp/classes/Historique.dart';
import 'package:projet_2cp/servises/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  //************************************* Attributs ***************************************************//
  String _id;
  //String _username;
  String _email;
  String _password;
  String _nom;
  String _prenom;
  String _phone;
  List<Vehicule>_list_vehicles ;
  //photo
  Location _location;
  //Boite de reception
  List<Groupe>_list_groupes ;
  Historique _historique ;
  bool _active;
  double _vitesse;

  //Auth
  final ServicesAuth _auth = ServicesAuth();
  //DB
  final Firestore _firestore = Firestore.instance;
  //*****************************************Constructors*********************************************************//
  //Creer un nouveau utilisateur
  Utilisateur.neww (String id, String email, String password, String nom,
      String prenom)
  {
    this._id = id;
    this._email = email;
    this._password = password;
    this._nom = nom;
    this._prenom = prenom;
    this._active = true;
    this._historique = new Historique();
    this._list_groupes = new List<Groupe> ();
    this._list_vehicles = new List<Vehicule>();
    createUserDoc(this);
  }

  //Creer un utilisateur a partir d'un doc Firestore
  Utilisateur.old (DocumentReference doc)
  {
    //
  }

  //*********************************************Methods*****************************************************//
  //Create a new User doc of the user
  Future createUserDoc(Utilisateur user) async
  {
    Location location = Location();
    try {
      await _firestore.collection("users")
          .document(user.getId())
          .setData({
        'UID': user.getId(),
        'Nom': user.getNom(),
        'Prenom': user.getPrenom(),
        'email': user.getEmail(),
        //String _username;
        'Password': user.getPassword(),
        'Phone': '',
        'Vehicules' : '', //*****
        'PhotoURL': '', //*****
        'Location': location,
        'BoiteReception' : '', //*****
        'Groupe' : '', //*****
        'Historique' : '', //*****
        'Active': true,
        'Vitesse': 0.0,
      });
    }
    catch (e) {
      print(e.toString());
    }
  }

  //Getter and setters
  String getId() {
    return this._id;
  }

  String getNom() {
    return this._nom;
  }

  String getPrenom() {
    return this._prenom;
  }

  String getPhone() {
    return this._phone;
  }

  String getEmail() {
    return this._email;
  }

  String getPassword() {
    return this._password;
  }

  //Change user's password
  Future <void> setPassword(String oldPassword, String newPassword) async
  {
    if (this._password == oldPassword) {
      await _auth.changePassword(newPassword);
      this._password = newPassword;
    }
    else {
      print('Wrong password');
    }
  }

  //Reser the password
  Future<void> recupererMotPasse() async
  {
    await _auth.resetPassword(this._email);
  }

  void rejoindreGroupe(Groupe g) {//???
    _list_groupes.add(g);
  }

  void quitterGroupe(Groupe g) {
    _list_groupes.remove(g);
  }

  void supprimerHistorique() { ///////////////////////////////////////////////////////////////////
      _historique.supprimer();
  }

  void supprimerHistoriqueGroupe(String groupe) {/////////////////////////////////////////////////
    _historique.supprimerGroupe(groupe);
  }
  void setPhone (String phone) {
        this._phone = phone;
        _firestore.collection("users").document(this._id).updateData(
            {
              "Phone": phone,
            }
        ).then((result) {
          print("phone number changed");
        }).catchError((onError) {
          print("Error");
        });
  }
  //Change active status
  void changeActiveStatus() {
    _active = !_active;
    _firestore.collection("users").document(this._id).updateData(
        {
          "Active": _active,
        }
    ).then((result) {
      print("Status changed");
    }).catchError((onError) {
      print("Error");
    });
  }
  //Change display name
  void setNomPrenom(String nom, String prenom) {
    if (nom != null) {
      this._nom = nom;
      _firestore.collection("users").document(this._id).updateData(
          {
            "Nom": nom,
          }
      ).then((result) {
        print("Nom change");
      }).catchError((onError) {
        print("Error");
      });
    }
    if (prenom != null) {
      this._prenom = prenom;
      _firestore.collection("users").document(this._id).updateData(
          {
            "Prenom": prenom,
          }
      ).then((result) {
        print("Nom change");
      }).catchError((onError) {
        print("Error");
      });
    }
  }
}
class Vehicule
{

}



