import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/pokemon_entity.dart';
import '../../favorites/controller/favorites_controller.dart';
import 'pokemon_base_status_widget.dart';
import 'pokemon_description_widget.dart';
import 'pokemon_infos_widget.dart';
import 'pokemon_types_widget.dart';

class PokemonDetailsContainerWidget extends StatefulWidget {
  PokemonDetailsContainerWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonEntity pokemon;

  @override
  State<PokemonDetailsContainerWidget> createState() =>
      _PokemonDetailsContainerWidgetState();
}

class _PokemonDetailsContainerWidgetState
    extends ModularState<PokemonDetailsContainerWidget, FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 15),
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: IconButton(
            alignment: Alignment.bottomRight,
            iconSize: 40,
            onPressed: () {
              setState(() {
                controller.changePokemonFavorite(
                  pokemonID: widget.pokemon.id,
                );
              });
            },
            padding: const EdgeInsets.all(0),
            //? Falta terminar de implementar a cor do favorito para cada estado.
            icon: controller.listPokemonID.contains(widget.pokemon.id)
                ? const Icon(Icons.favorite_border)
                : const Icon(Icons.favorite),
          ),
        ),
        PokemonTypesWidget(
          pokeLength: widget.pokemon.types.length,
          types: widget.pokemon.types,
        ),
        PokemonInfosWidget(
          pokeWeight: widget.pokemon.weight,
          pokeHeight: widget.pokemon.height,
          move1: widget.pokemon.moves[0].name,
          move2: widget.pokemon.moves[1].name,
        ),
        PokemonDescriptionWidget(specie: widget.pokemon.specie),
        PokemonBaseStatsWidget(
          type: widget.pokemon.types[0],
          statusList: widget.pokemon.status,
        ),
      ],
    );
  }
}
