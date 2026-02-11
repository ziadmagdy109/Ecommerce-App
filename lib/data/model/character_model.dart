class CharacterModel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    image = json["image"];
  }
}
