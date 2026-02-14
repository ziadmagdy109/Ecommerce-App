import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/model/character_model.dart';
import 'package:ecommerce_app/data/repo/character_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.characterRepository) : super(CharacterInitial());
  final CharacterRepository characterRepository;
  List<CharacterModel> characters = [];
  List<CharacterModel> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
