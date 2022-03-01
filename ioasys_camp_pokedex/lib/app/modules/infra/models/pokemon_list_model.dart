import '../../domain/entities/pokemon_list_entity.dart';
import '../../domain/entities/pokemon_list_item_entity.dart';

class PokemonListModel extends PokemonListEntity {
  PokemonListModel(
      {required int count,
      required String next,
      required String back,
      required List<PokemonListItemEntity> pokemons})
      : super(count: count, next: next, back: back, pokemons: pokemons);

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    List<PokemonListItemEntity> pokemonsEntry = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        pokemonsEntry
            .add(PokemonListItemEntity(name: v['name'], url: v['url']));
      });
    }
    return PokemonListModel(
        count: json['count'],
        next: json['next'] ?? '',
        back: json['previous'] ?? '',
        pokemons: pokemonsEntry);
  }
}
