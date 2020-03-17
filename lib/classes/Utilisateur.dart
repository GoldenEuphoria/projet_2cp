import 'package:location/location.dart';
class Utilisateur {
  String _id ;
  //String _username;
  String _password;
  String _nom;
  String _prenom;
  String _email;
  String _phone;
  var _list_vehicles = new List ();
  //photo
  //******//
  Location _location;
  //Boite de reception
  var _list_groupes = new List () ;
  var _historique = new Map();
  bool _active;
  double _vitesse ;
  int _codeConfirmation = 0;
  Utilisateur (String id ,String email, String password , String nom , String prenom)
  {
    this._id = id;
    this._email = email;
    this._password = password;
    this._nom = nom;
    this._prenom = prenom ;
  }
  void setPassword (String newPassword,String oldPassword)
  {
     if(this._password.compareTo(oldPassword)==0)
       {
          this._password = newPassword;
       }
     else
       {
          print("Wrong password");
       }
  }
  void recupererMotPasse(int code,String newPassword)
  {
    if(code==_codeConfirmation) {
      this._password = newPassword;
    }
    else
     {
       print("Wrong code");
     }
  }
  void rejoindreGroupe (Groupe g)
  {
    _list_groupes.add(g);
  }
  void quitterGroupe (Groupe g)
  {
    _list_groupes.remove(g);
  }
  void supprimerHistorique()
  {
    _historique.clear();
  }
  void supprimerHistoriqueGroupe(Groupe g)
  {
    _historique.remove(g);
  }
  void changeActiveStatus()
  {
      _active = !_active;
  }
  void setNomPrenom(String nom,String prenom)
  {
    this._nom = nom;
    this._prenom = prenom;
  }
}

class Vehicule
{

}
class Groupe
{

}

class Historique {
  //Location location;
  //Date date;
}