enum Vocation{
  dada(
    title:"Beeg Dada",
    description: "BEEG Dada! BEEG Dada swing BEEG Hammer",
    weapon: "Two-handed Mace",
    ability: "well-timed joke",
    image: "dada.jpeg"
  ),
    coach(
    title:"coach",
    description: "A master of the athletic arts, none are safe. He plays for keeps.",
    weapon: "Golf Club",
    ability: "Shrug-off",
    image: "coach.jpg"
  ),
    queen(
    title:"Queen",
    description: "A master of the voice, she controlls all within her range",
    weapon: "Voice",
    ability: "Overwhelm",
    image: "queen.jpg"
  ),
    gremlin(
    title:"Gremlin",
    description: "A toddling creature, it eats much and thinks little.",
    weapon: "Fucking everything",
    ability: "Tantrum",
    image: "gremlin.jpg"
  ),

    potato(
    title:"Potato",
    description: "A sentient potato. Useless yet inedible.",
    weapon: "none",
    ability: "wriggle and scream",
    image: "potato.jpg"
  ),
  
  ;
  
  
  
  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;


}