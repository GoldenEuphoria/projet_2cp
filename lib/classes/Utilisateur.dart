import 'package:location/location.dart';
class Utilisateur {
  String id;
  String username;
  String password;
  String nom;
  String prenom;
  String email;
  String phone;
  var list_vehicles = new List ();
  //photo
  //******//
  Location location;
  //Boite de reception
  var list_groupes = new List () ;
  var historique = new Map();
  bool active;
  double vitesse ;
  int code_confirmation = 0;
  void setPassword (String newPassword,String oldPassword)
  {
     if(this.password.compareTo(oldPassword)==0)
       {
          this.password = newPassword;
       }
     else
       {
          print("Wrong password");
       }
  }
  void recuperer_mot_passe(int code,String newPassword)
  {
    if(code==code_confirmation) {
      this.password = newPassword;
    }
    else
     {
       print("Wrong code");
     }
  }
  void rejoindreGroupe (Groupe g)
  {
    list_groupes.add(g);
  }
  void quitterGroupe (Groupe g)
  {
    var remove = list_groupes.remove(g);
  }
  void supprimerHistorique()
  {
    historique.clear();
  }
  void supprimerHistorique_Groupe(Groupe g)
  {
    historique.remove(g);
  }
  void changeActiveStatus()
  {
      active = !active;
  }
  void setNomPrenom(String nom,String prenom)
  {
    this.nom = nom;
    this.prenom = prenom;
  }
}

class Vehicule
{

}
class Groupe
{

}