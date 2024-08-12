


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats{

  //Fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  //Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.id,
    required this.vocation,
  });


  void toggleIsFav(){
    _isFav = !_isFav;
  }

  void updateSkill(Skill s){
    skills.clear();
    skills.add(s);
  }


  //Character to firestore (map)
  Map<String,dynamic> toFirestore(){

    return{
      "name":name,
      "slogan":slogan,
      "isFav":_isFav,
      "vocation":vocation.toString(),
      "skills": skills.map((s)=>s.id).toList(),
      "stats": statsAsMap,
      "points": points,
    };
  }

  //Firestore data to Character
  factory Character.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data()!;
    Character character = Character(name: data["name"], 
                                    slogan: data["slogan"], 
                                    id: snapshot.id, 
                                    vocation: Vocation.values.firstWhere((v)=> v.toString()== data["vocation"]));
  
  //Update Stats
    for(String id in data["skills"]){
      Skill skill = allSkills.firstWhere((s)=>s.id == id);
      character.updateSkill(skill);
    }
  //set isFav
    if(data["isFav"]){
      character.toggleIsFav();
    }

  //set stats
    character.setStats(points: data["points"], stats: data["stats"]);

    return character;
  
  }


  //GETTERS
  bool get isFav => _isFav;





  

}
final List <Character> characters =[
  Character(id: "1",name: "Joe Richard", slogan:"I just need an indoor chair and an outdoor chair" , vocation:  Vocation.dada),
  Character(id: "2",name: "Tori Richard", slogan:"Well I don't like that at all..." , vocation:  Vocation.queen),
  Character(id: "3",name: "Logan McDaniel", slogan:"You get alot of that on these big jobs..." , vocation:  Vocation.coach),
  Character(id: "4",name: "Dean Richard", slogan:"BEEG GAGA CARS ON UP MAMA DADA NUMNA!" , vocation:  Vocation.gremlin),
  Character(id: "5",name: "Leon Richard", slogan:"*potato noises*" , vocation:  Vocation.potato),
];