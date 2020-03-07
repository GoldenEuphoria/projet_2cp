import 'Message.dart';

class Discussion{
  var liste_messages = new List();

  void ajouterMessage(Message M){
    liste_messages.add(M);
  }

  void supprimerMessage(Message M){
    liste_messages.remove(M);
  }

}