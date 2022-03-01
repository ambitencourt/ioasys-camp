import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/pokemon_list_entity.dart';
import '../../../../domain/usecases/themes/notifier_theme.dart';
import '../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PokemonPageNavigator extends StatefulWidget {
  const PokemonPageNavigator({
    Key? key,
    required this.nextPage,
    required this.listPokemon,
  }) : super(key: key);

  final Function nextPage;
  final PokemonListEntity? listPokemon;

  @override
  State<PokemonPageNavigator> createState() => _PokemonPageNavigatorState();
}

class _PokemonPageNavigatorState
    extends ModularState<PokemonPageNavigator, HomeController> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: widget.listPokemon!.back.isEmpty ? false : true,
          child: IconButton(
            iconSize: 50,
            onPressed: () {
              widget.nextPage(widget.listPokemon!.back);
            },
            icon: FaIcon(
              FontAwesomeIcons.backward,
              size: 50,
              color: ThemeNotifier.themeNotifier.value == ThemeMode.light
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        IconButton(
          iconSize: 50,
          onPressed: () {
            widget.nextPage(widget.listPokemon!.next);
          },
          icon: FaIcon(
            FontAwesomeIcons.forward,
            size: 50,
            color: ThemeNotifier.themeNotifier.value == ThemeMode.light
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
