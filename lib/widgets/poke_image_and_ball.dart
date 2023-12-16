import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/ui_helper.dart';

import 'package:pokedex_app/model/pokemon_model.dart';

class PokemonImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonImageAndBall({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImage = "images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImage,
            width: UIHelper.calculatePokemonImageAndBallSize(),
            height: UIHelper.calculatePokemonImageAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img!,
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              width: UIHelper.calculatePokemonImageAndBallSize(),
              height: UIHelper.calculatePokemonImageAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
