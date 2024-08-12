mixin Stats{

int _points = 10;
int _health = 10;
int _attack = 10;
int _defense = 10;
int _skill = 10;

void increaseStat(String stat){
  if(_points >0){
    switch(stat){
      case "health":
        _health++;
        _points--;
      case "attack":
        _attack++;
        _points--;
      case "defense":
        _defense++;
        _points--;
      case "skill":
        _skill++;
        _points--;
      default:
        break;
    }
  }
}

void decreaseStat(String stat){
  switch(stat){
    case "health":
      if(_health > 5){
        _health--;
        _points++;
      }

    case "attack":
      if(_attack > 5){
        _attack--;
        _points++;
      }

    case "defense":
      if(_defense > 5){
        _defense--;
        _points++;
      }

    case "skill":
      if(_skill > 5){
        _skill--;
        _points++;
      }
  }
}






//Getters and Setters
// int get totalPoints => _points;
// int get totalHealth => _health;
// int get totalAttack => _attack;
// int get totalDefense => _defense;
// int get totalSkill => _skill;

void setStats({required int points, required Map<String, dynamic> stats}){
  _points = points;

  _health = stats["health"];
  _attack = stats["attack"];
  _defense = stats["defense"];
  _skill = stats["skill"];

}

int get points=> _points;


Map<String, int> get statsAsMap => {
  "health": _health,
  "attack": _attack,
  "defense": _defense,
  "skill": _skill,
};

List <Map<String,String>> get statsAsFormattedList =>[
  {"title":"health","value":_health.toString()},
  {"title":"attack","value":_attack.toString()},
  {"title":"defense","value":_defense.toString()},
  {"title":"skill","value":_skill.toString()},
];

}

