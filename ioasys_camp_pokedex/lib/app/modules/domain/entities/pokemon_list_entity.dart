import 'pokemon_list_item_entity.dart';

class PokemonListEntity {
  int count;
  String next;
  String back;
  List<PokemonListItemEntity> pokemons;

  PokemonListEntity({
    required this.count,
    required this.next,
    required this.back,
    required this.pokemons,
  });
}
