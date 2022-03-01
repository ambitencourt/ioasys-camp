import 'package:dio/dio.dart';
import '../domain/entities/pokemon_description_entity.dart';
import '../domain/repositories/pokemon_description_interface_repository.dart';
import 'models/pokemon_description_model.dart';

class PokemonDescriptionRepository extends IPokemonDescriptionRepository {
  final Dio dio = Dio();

  @override
  Future<PokemonDescriptionEntity> fetchPokemonData(
      {required String link}) async {
    final response = await dio.get(link);
    return PokemonDescriptionModel.fromJson(response.data);
  }
}
