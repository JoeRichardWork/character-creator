

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService{

static final ref = FirebaseFirestore.instance
                    .collection('characters')
                    .withConverter(
                      fromFirestore: Character.fromFirestore, 
                      toFirestore: (Character c, _) => c.toFirestore()
                      );


//Add a new character
static Future<void> addCharacter(Character c) async{
  await ref.doc(c.id).set(c);
}

//Get characters once
static Future<QuerySnapshot<Character>> getCharactersOnce() async{
  return ref.get();
} 

//Update a character
static Future<void> updateCharacter(Character c) async{
  await ref.doc(c.id).update({
    'stats':c.statsAsMap ,
    'points': c.points,
    'skills': c.skills.map((s) => s.id,).toList(),
    'isFav': c.isFav,

  });
}


//Delete a character
static Future<void> deleteCharacter(Character c) async{
  await ref.doc(c.id).delete();
}


}

