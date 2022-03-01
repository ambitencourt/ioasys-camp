import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.favorite, size: 30),
        label: const Text('Favoritos'),
        onPressed: () {
          Modular.to.pushNamed(
            'favorites',
          );
        },
      ),
    );
  }
}
