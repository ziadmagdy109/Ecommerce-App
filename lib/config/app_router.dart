import 'package:ecommerce_app/config/app_routes.dart';
import 'package:ecommerce_app/data/repo/character_repository.dart';
import 'package:ecommerce_app/data/service/character_service.dart';
import 'package:ecommerce_app/logic/cubit/character_cubit.dart';
import 'package:ecommerce_app/views/character_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharacterService());
    characterCubit = CharacterCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => characterCubit,
            child: CharacterView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
