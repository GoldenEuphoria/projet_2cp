import 'package:location/location.dart';

import 'package:projet_2cp/classes/Utilisateur.dart';

import 'TypeGroupe.dart';



abstract class Groupe{

  var liste_utilisateurs = new List();
  String nom;
  String ID;
  Location Destination;
  DateTime datedepart ;
  Utilisateur admin;
  TypeGroupe type;
  Discussion discussion;

  void ajouterMembre(Utilisateur M){

    liste_utilisateurs.add(M);

  }

  void envoyerID(Utilisateur M){

  }
   void afficher(); //UNE METHODE ABSTRAITE

  }

class Discussion {
}

