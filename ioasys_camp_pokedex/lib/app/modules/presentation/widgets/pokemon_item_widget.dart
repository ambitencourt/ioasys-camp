import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../commons/loading_widget.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/usecases/pokemon_colors_usecase.dart';
import 'pokemon_item_name_widget.dart';
import 'pokemon_item_number_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  final PokemonEntity pokeData;
  final String router;

  const PokemonItemWidget({
    Key? key,
    required this.pokeData,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (router == 'favorites') {
            Modular.to.pushReplacementNamed(
              'pokemon',
              arguments: [pokeData, router],
            );
          } else {
            Modular.to.pushNamed(
              'pokemon',
              arguments: [pokeData, router],
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors().pokemonColor(
                pokeData.types[0],
              ),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              PokemonItemNumberWidget(pokeData: pokeData),
              Image.network(
                pokeData.sprite,
                width: 71,
                height: 72,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: Loading(height: 70, width: 71),
                  );
                },
              ),
              PokemonItemNameWidget(pokeData: pokeData),
            ],
          ),
        ));
  }
}
