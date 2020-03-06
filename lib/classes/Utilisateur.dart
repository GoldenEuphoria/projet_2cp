import 'package:location/location.dart';
class Utilisateur {
  String _id;
  String _username;
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
  int _code_confirmation = 0;
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
  void recuperer_mot_passe(int code,String newPassword)
  {
    if(code==_code_confirmation) {
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
    var remove = _list_groupes.remove(g);
  }
  void supprimerHistorique()
  {
    _historique.clear();
  }
  void supprimerHistorique_Groupe(Groupe g)
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
  Location location;
  //Date date;
}