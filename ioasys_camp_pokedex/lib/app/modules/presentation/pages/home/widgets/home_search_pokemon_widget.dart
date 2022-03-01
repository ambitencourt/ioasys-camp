import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class SearchPokemonWidget extends StatelessWidget {
  const SearchPokemonWidget({
    Key? key,
    required this.search,
  }) : super(key: key);
  final Function search;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            onSubmitted: (value) {
              search(value);
            },
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            decoration: InputDecoration(
              labelText: 'search'.i18n(),
              hintText: 'search'.i18n() + " Pokémon",
              contentPadding: const EdgeInsets.fromLTRB(40, 15, 30, 15),
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
