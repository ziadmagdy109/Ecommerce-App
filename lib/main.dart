import 'package:ecommerce_app/data/repo/character_repository.dart';
import 'package:ecommerce_app/data/service/character_service.dart';
import 'package:ecommerce_app/logic/cubit/character_cubit.dart';
import 'package:ecommerce_app/my_app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) =>
          CharacterCubit(CharacterRepository(CharacterService())),
      child: MyApp(),
    ),
  );
}
