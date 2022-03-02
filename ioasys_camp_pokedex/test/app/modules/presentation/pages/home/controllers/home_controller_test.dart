import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_ioasys/app/modules/infra/pokemon_list_repository.dart';

main() {
  final repository = PokemonListRepository();
  test(
    '''Deve trazer uma lista de Pokemons ''',
    () async {
      final list = await repository.getPokemonList(
          link: 'https://pokeapi.co/api/v2/pokemon?limit=15');
      print('$list \n');
      print(list.pokemons);
      expect(list.pokemons[3].name, 'charmander');
    },
  );
}
