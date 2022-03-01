import '../../domain/entities/pokemon_entity.dart';

import '../../infra/pokemon_repository.dart';

class PokemonItemController {
  final repository = PokemonRepository();

  Future<PokemonEntity> getPokemon({required String pokemon}) async {
    var result = await repository
        .fetchPokemonData(pokemon: pokemon)
        .onError((error, stackTrace) => throw Error());
    return result;
  }
}
