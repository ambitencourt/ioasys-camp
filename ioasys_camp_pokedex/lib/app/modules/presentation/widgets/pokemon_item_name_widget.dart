import 'package:flutter/material.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/usecases/pokemon_colors_usecase.dart';
import '../../domain/usecases/pokemon_formatter_usecase.dart';

class PokemonItemNameWidget extends StatelessWidget {
  const PokemonItemNameWidget({
    Key? key,
    required this.pokeData,
  }) : super(key: key);

  final PokemonEntity pokeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26,
      decoration: BoxDecoration(
        color: CustomColors().pokemonColor(pokeData.types[0]),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        PokemonFormatter().formatName(pokeData.name),
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
