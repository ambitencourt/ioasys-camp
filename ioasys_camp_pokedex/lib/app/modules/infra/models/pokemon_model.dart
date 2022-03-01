import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/pokemon_status_entity.dart';
import '../../domain/entities/pokemon_moves_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required int weight,
      required int height,
      required int id,
      required String name,
      required String sprite,
      required String url,
      required String specie,
      required List<PokemonMoveEntity> moves,
      required List<PokemonStatusEntity> status,
      required List<String> types})
      : super(
            weight: weight,
            height: height,
            id: id,
            name: name,
            sprite: sprite,
            url: url,
            specie: specie,
            moves: moves,
            status: status,
            types: types);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<PokemonMoveEntity> listMoves = [];
    List<PokemonStatusEntity> listStatus = [];
    List<String> typesEntry = [];

    if (json['moves'].length == 0) {
      listMoves.add(PokemonMoveEntity(
          name: "move", url: "https://pokeapi.co/api/v2/move/${json['id']}"));
    } else {
      json['moves'].forEach((m) {
        listMoves.add(
            PokemonMoveEntity(name: m['move']['name'], url: m['move']['url']));
      });
    }

    json['stats'].forEach((s) {
      listStatus.add(
        PokemonStatusEntity(name: s['stat']['name'], value: s['base_stat']),
      );
    });

    json['types'].forEach((t) {
      typesEntry.add(t['type']['name']);
    });

    return PokemonModel(
      id: json['id'],
      weight: json['weight'],
      height: json['height'],
      name: json['name'] ?? '',
      url: "https://pokeapi.co/api/v2/pokemon/${json['id']}",
      moves: listMoves,
      status: listStatus,
      types: typesEntry,
      sprite: json['sprites']['other']['official-artwork']['front_default'] ??
          json['sprites']['front_default'] ??
          json['sprites']['versions']['generation-viii']['icons']
              ['front_default'],
      specie: json['species']['url'],
    );
  }
}
