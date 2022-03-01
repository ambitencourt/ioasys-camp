import '../../../../domain/entities/pokemon_description_entity.dart';

import '../../../../infra/pokemon_details_repository.dart';

class PokemonDetailsController {
  final _repository = PokemonDescriptionRepository();

  Future<PokemonDescriptionEntity> getPokemonSpecie(String linkArg) async {
    var result = await _repository
        .fetchPokemonData(link: linkArg)
        .onError((error, stackTrace) => throw Error());

    return result;
  }
}
