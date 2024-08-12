import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/services/firestore_service.dart';
import 'package:provider/provider.dart';

class CharacterStore extends ChangeNotifier {
//   final List <Character> _characters_old =[
//   Character(id: "1",name: "Joe Richard", slogan:"I just need an indoor chair and an outdoor chair" , vocation:  Vocation.dada),
//   Character(id: "2",name: "Tori Richard", slogan:"Well I don't like that at all..." , vocation:  Vocation.queen),
//   Character(id: "3",name: "Logan McDaniel", slogan:"You get alot of that on these big jobs..." , vocation:  Vocation.coach),
//   Character(id: "4",name: "Dean Richard", slogan:"BEEG GAGA CARS ON UP MAMA DADA NUMNA!" , vocation:  Vocation.gremlin),
//   Character(id: "5",name: "Leon Richard", slogan:"*potato noises*" , vocation:  Vocation.potato),
// ];

final List <Character> _characters =[];

void addCharacter(Character c){
  FirestoreService.addCharacter(c);
  _characters.add(c);
  notifyListeners();

}

//save (update) character
Future<void> saveCharacter(Character c) async{
  await FirestoreService.updateCharacter(c);
  return;
}


//remove character
void removeCharacter(Character c) async{
  await FirestoreService.deleteCharacter(c);
  _characters.remove(c);
  notifyListeners();
}



//initially fetch characters
void fetchCharactersOnce() async{
  if(characters.isEmpty){
    final snapshot = await FirestoreService.getCharactersOnce();

    for(var doc in snapshot.docs){
      _characters.add(doc.data());
    }
    notifyListeners();


  }
}


//Getters and Setters
get characters => _characters;

}