class BreakingBadModel {
  int charId;
  String? name;
  String? occupation;
  String? img;
  String? portrayed;

  BreakingBadModel(
      {required this.charId,
      this.name,
      this.occupation,
      this.img,
      this.portrayed});

  factory BreakingBadModel.transformarInstancia(
          Map<String, dynamic> personaje) =>
      BreakingBadModel(
        charId: personaje['char_id'],
        name: personaje['name'],
        occupation: personaje['occupation'],
        img: personaje['img'],
        portrayed: personaje['portrayed'],
      );
}
