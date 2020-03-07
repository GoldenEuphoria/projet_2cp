import 'Utilisateur.dart';

class Message {

  String text;
  Type type;
  Utilisateur expediteur;

  void setMessage(String text)
  {
    this.text = text;
  }

  void afficher(){

    print(text);
    //print(new DateFormat.yMMMd().format(new DateTime.now()));
    print(expediteur.nom);
    print(expediteur.prenom);



  }



}
class Groupe {

}
