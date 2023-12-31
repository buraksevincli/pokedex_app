import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokemonInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w), color: Colors.white),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          _buildInformationRow("Name", pokemon.name),
          _buildInformationRow("Height", pokemon.height),
          _buildInformationRow("Weight", pokemon.weight),
          _buildInformationRow("Spawn Time", pokemon.spawnTime),
          _buildInformationRow("Weakness", pokemon.weaknesses),
          _buildInformationRow("Pre Evolution", pokemon.prevEvolution),
          _buildInformationRow("Next Evolution", pokemon.nextEvolution),
        ]),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokemonInfoLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(" , "),
            style: Constants.getPokemonInfoTextStyle(),
          )
        else if (!value.isNotEmpty)
          Text(
            "Not available",
            style: Constants.getPokemonInfoTextStyle(),
          )
        else
          Text(value.toString())
      ],
    );
  }
}
