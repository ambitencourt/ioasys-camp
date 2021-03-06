import 'package:flutter/material.dart';
import '../../../../domain/entities/pokemon_description_entity.dart';

import '../../../widgets/error_generic_widget.dart';
import '../controller/pokemon_details_controller.dart';

class PokemonDescriptionWidget extends StatelessWidget {
  const PokemonDescriptionWidget({
    Key? key,
    required this.specie,
  }) : super(key: key);

  final String specie;
  @override
  Widget build(BuildContext context) {
    final _controller = PokemonDetailsController();

    return FutureBuilder<PokemonDescriptionEntity>(
      future: _controller.getPokemonSpecie(specie),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: LinearProgressIndicator(color: Colors.green),
            );
          case ConnectionState.none:
            return const LinearProgressIndicator(
              value: 1,
              color: Colors.red,
            );
          default:
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(snapshot.data!.flavorText,
                    style: const TextStyle(fontSize: 14)),
              );
            } else {
              return const ErrorGenericWidget();
            }
        }
      },
    );
  }
}
