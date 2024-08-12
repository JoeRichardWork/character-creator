import 'package:flutter_rpg/models/vocation.dart';

class Skill{
  final String id;
  final String name;
  final String img;
  final Vocation vocation;

  Skill({
    required this.id,
    required this.name,
    required this.img,
    required this.vocation
  });

}

  //List of skills
  final List<Skill> allSkills =[
    Skill(id: "1",name: "Overthink",img: "overthink.jpg", vocation: Vocation.dada),
    Skill(id: "2",name: "Identify Animal",img: "identify_animal.jpg", vocation: Vocation.dada),
    Skill(id: "3",name: "Distract",img: "distract.jpeg", vocation: Vocation.dada),
    Skill(id: "4",name: "Watchful Eye",img: "watchful_eye.jpeg", vocation: Vocation.dada),

    Skill(id: "5",name: "Double Play",img: "double_play.jpg", vocation: Vocation.coach),
    Skill(id: "6",name: "Phrase of Charisma",img: "phrase_of_charisma.jpeg", vocation: Vocation.coach),
    Skill(id: "7",name: "Supreme Drive",img: "supreme_swing.jpg", vocation: Vocation.coach),
    Skill(id: "8",name: "laugh",img: "laugh.jpg", vocation: Vocation.coach),

    Skill(id: "9",name: "Feast",img: "feast.jpg", vocation: Vocation.queen),
    Skill(id: "10",name: "Glare",img: "glare.jpg", vocation: Vocation.queen),
    Skill(id: "11",name: "Queen's Decree",img: "decree.jpg", vocation: Vocation.queen),
    Skill(id: "12",name: "Off with their head!",img: "off_with_their_head.jpg", vocation: Vocation.queen),

    Skill(id: "13",name: "Gaga",img: "gaga.jpg", vocation: Vocation.gremlin),
    Skill(id: "14",name: "Toddle",img: "toddle.jpg", vocation: Vocation.gremlin),
    Skill(id: "15",name: "Blindside",img: "blindside.jpg", vocation: Vocation.gremlin),
    Skill(id: "16",name: "Improbable Innocence",img: "improbable_innocence.jpg", vocation: Vocation.gremlin),

    Skill(id: "17",name: "Grin",img: "laugh.jpg", vocation: Vocation.potato),
    Skill(id: "18",name: "Fatal Fumes",img: "fatal_fumes.jpg", vocation: Vocation.potato),
    Skill(id: "19",name: "Banshee's Wale",img: "banshees_wale.jpg", vocation: Vocation.potato),
    Skill(id: "20",name: "Sleep",img: "sleep.jpg", vocation: Vocation.potato),
  ];