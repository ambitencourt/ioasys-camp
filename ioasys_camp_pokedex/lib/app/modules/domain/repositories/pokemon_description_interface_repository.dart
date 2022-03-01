import '../entities/pokemon_description_entity.dart';

abstract class IPokemonDescriptionRepository {
  Future<PokemonDescriptionEntity> fetchPokemonData({required String link});
}
