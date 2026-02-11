import 'package:ecommerce_app/data/model/character_model.dart';
import 'package:ecommerce_app/data/service/character_service.dart';

class CharacterRepository {
  final CharacterService characterService;

  CharacterRepository(this.characterService);

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await characterService.getAllCharacters();
    return characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}
