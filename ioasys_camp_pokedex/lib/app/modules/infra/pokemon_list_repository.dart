import 'package:dio/dio.dart';
import '../domain/entities/pokemon_list_entity.dart';
import '../domain/repositories/pokemon_list_interface_repository.dart';
import 'models/pokemon_list_model.dart';

class PokemonListRepository extends IPokemonListRepository {
  final Dio dio = Dio();

  @override
  Future<PokemonListEntity> getPokemonList({required String link}) async {
    final response = await dio.get(link);
    return PokemonListModel.fromJson(response.data);
  }
}
