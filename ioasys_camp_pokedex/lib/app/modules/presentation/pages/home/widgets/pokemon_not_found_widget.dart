import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class PokemonNotFoundWidget extends StatelessWidget {
  const PokemonNotFoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Oops",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 120,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'pokemonNotFound'.i18n(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
