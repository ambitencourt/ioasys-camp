import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/pokemon_list_entity.dart';
import '../../../widgets/error_generic_widget.dart';
import '../controllers/home_controller.dart';
import 'home_favorites_buttom_widget.dart';
import 'home_search_pokemon_widget.dart';
import 'pokemon_list_widget.dart';
import 'pokemon_not_found_widget.dart';
import 'pokemon_page_navigator_widget.dart';

class PokemonGridWidget extends StatefulWidget {
  final PokemonListEntity? listPokemon;

  const PokemonGridWidget({
    Key? key,
    this.listPokemon,
  }) : super(key: key);

  @override
  State<PokemonGridWidget> createState() => _PokemonGridWidgetState();
}

class _PokemonGridWidgetState
    extends ModularState<PokemonGridWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 20),
          child: SearchPokemonWidget(search: (value) {
            setState(() {
              controller.setSearchPokemon(value);
            });
          }),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: FavoritesWidget(),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<PokemonListEntity>(
          future: controller.getPokemonList(controller.getLinkInitial()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              case ConnectionState.none:
                return const LinearProgressIndicator(
                  value: 1,
                  color: Colors.red,
                );
              default:
                if (snapshot.hasData) {
                  if (snapshot.data!.pokemons.isNotEmpty) {
                    return Column(
                      children: [
                        PokemonListWidget(
                          listPokemon: snapshot.data,
                        ),
                        PokemonPageNavigator(
                          nextPage: (value) {
                            setState(() {
                              controller.getPokemonList(value);
                            });
                          },
                          listPokemon: snapshot.data,
                        ),
                      ],
                    );
                  } else {
                    return const PokemonNotFoundWidget();
                  }
                } else {
                  return const ErrorGenericWidget();
                }
            }
          },
        )
      ],
    );
  }
}
