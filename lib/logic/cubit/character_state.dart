part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoaded extends CharacterState {
  final List<CharacterModel> characters;

  CharacterLoaded({required this.characters});
}

final class CharacterLoading extends CharacterState {}

final class CharacterFailure extends CharacterState {
  final String errMessage;

  CharacterFailure({required this.errMessage});
}
