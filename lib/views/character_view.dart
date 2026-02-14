import 'package:ecommerce_app/data/model/character_model.dart';
import 'package:ecommerce_app/logic/cubit/character_cubit.dart';
import 'package:ecommerce_app/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late List<CharacterModel> allCharacters;
  @override
  void initState() {
    super.initState();
     BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildLoadedCharacter() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = (state).characters;
          return buildScreenWidget();
        } else {
          return Center(child: CircularProgressIndicator(color: Colors.yellow));
        }
      },
    );
  }

  Widget buildScreenWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(children: [buildCharactersGrid()]),
      ),
    );
  }

  Widget buildCharactersGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(characterModel: allCharacters[index],);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text("Ecommerce_App"),
      ),
      //
      body: buildLoadedCharacter(),
    );
  }
}
