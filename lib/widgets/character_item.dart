import 'package:ecommerce_app/data/model/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.characterModel});
  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: characterModel.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  height: double.infinity,
                  width: double.infinity,
                  placeholder: "assets/Loading.gif",
                  image: characterModel.image,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/batman.jpg"),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${characterModel.name}",
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
