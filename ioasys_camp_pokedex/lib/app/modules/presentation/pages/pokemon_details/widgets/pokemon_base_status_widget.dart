import 'package:flutter/material.dart';
import '../../../../domain/usecases/pokemon_colors_usecase.dart';
import 'pokemon_base_status_list_widget.dart';
import 'package:localization/localization.dart';

class PokemonBaseStatsWidget extends StatelessWidget {
  const PokemonBaseStatsWidget({
    Key? key,
    required this.type,
    required this.statusList,
  }) : super(key: key);

  final String type;
  final List statusList;
  @override
  Widget build(BuildContext context) {
    final _color = CustomColors();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'baseStats'.i18n(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: _color.pokemonColor(type),
            ),
          ),
        ),
        PokemonBaseStatusList(statusList: statusList, type: type),
      ],
    );
  }
}
