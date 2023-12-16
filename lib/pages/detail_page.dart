import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_type_name.dart';
import 'package:pokedex_app/widgets/pokemon_info.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraidBody(context)
        : _buildLanscapeBody(context);
  }

  Scaffold _buildPortraidBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getIconPadding(),
            child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          PokeNameType(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(children: [
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset(
                "images/pokeball.png",
                height: .15.sh,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: .12.sh,
                child: PokemonInformation(pokemon: pokemon)),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id!,
                child: CachedNetworkImage(
                  imageUrl: pokemon.img ?? "",
                  height: .25.sh,
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          ]))
        ],
      )),
    );
  }

  Scaffold _buildLanscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameType(pokemon: pokemon),
                      Expanded(
                        child: Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? "",
                            height: .25.sw,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokemonInformation(pokemon: pokemon),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
