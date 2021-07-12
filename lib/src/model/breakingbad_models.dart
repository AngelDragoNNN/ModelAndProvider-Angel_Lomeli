class BreakingBadModel {
  int charId;
  String? name;
  String? birthday;
  String? img;
  String? nickname;
  String? portrayed;

  BreakingBadModel(
      {required this.charId,
      this.name,
      this.birthday,
      this.img,
      this.nickname,
      this.portrayed});

  factory BreakingBadModel.transformarInstancia(
          Map<String, dynamic> personaje) =>
      BreakingBadModel(
        charId: personaje['char_id'],
        name: personaje['name'],
        birthday: personaje['birthday'],
        img: personaje['img'],
        nickname: personaje['nickname'],
        portrayed: personaje['portrayed'],
      );
}

