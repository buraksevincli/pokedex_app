import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokedexApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    var pokemonList = jsonDecode(result.data)["pokemon"];

    if (pokemonList is List) {
      _list = pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
    }

    return _list;
  }
}
