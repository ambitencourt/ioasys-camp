import 'pokemon_moves_entity.dart';
import 'pokemon_status_entity.dart';

class PokemonEntity {
  final int weight;
  final int height;
  final int id;
  final String name;
  final String sprite;
  final String url;
  final String specie;

  final List<PokemonMoveEntity> moves;
  final List<PokemonStatusEntity> status;
  final List<String> types;

  PokemonEntity({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.sprite,
    required this.url,
    required this.specie,
    required this.moves,
    required this.status,
    required this.types,
  });
}
