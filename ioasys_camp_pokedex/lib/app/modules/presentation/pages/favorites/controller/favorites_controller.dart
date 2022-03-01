import 'package:hive/hive.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../../infra/pokemon_repository.dart';

class FavoritesController {
  final repository = PokemonRepository();
  List<int> listPokemonID = [];

  Future<PokemonEntity> getFavoritePokemon({required pokemonID}) async {
    var result = await repository
        .fetchPokemonData(pokemon: pokemonID.toString())
        .onError((error, stackTrace) => throw Error());
    return result;
  }

  getFavoritesPokemonList() async {
    var hivePokemonBox = await Hive.openBox("pokemons");
    var hivePokemonindexList =
        await hivePokemonBox.get('pokemonFavoritesIDList');
    listPokemonID = hivePokemonindexList ?? [];
    Hive.close();
  }

  Future<void> changePokemonFavorite({required int pokemonID}) async {
    var hivePokemonBox = await Hive.openBox("pokemons");
    var hivePokemonindexList =
        await hivePokemonBox.get('pokemonFavoritesIDList');
    listPokemonID = hivePokemonindexList ?? [];

    var isPokemonOnList = listPokemonID.indexWhere((id) => id == pokemonID);

    if (isPokemonOnList >= 0) {
      listPokemonID.remove(pokemonID);
    } else {
      listPokemonID.add(pokemonID);
    }

    await hivePokemonBox.put('pokemonFavoritesIDList', listPokemonID);
    Hive.close();
  }
}
