import '../../domain/entities/pokemon_description_entity.dart';

class PokemonDescriptionModel extends PokemonDescriptionEntity {
  PokemonDescriptionModel({required String flavorText})
      : super(flavorText: flavorText);

  factory PokemonDescriptionModel.fromJson(Map<String, dynamic> json) {
    var textEntry = json['flavor_text_entries'];
    String flavorTextEntry = '';

    textEntry.forEach(
      (value) {
        if (value['language']['name'] == 'en') {
          flavorTextEntry = value['flavor_text'];
        }
      },
    );

    return PokemonDescriptionModel(
      flavorText: flavorTextEntry.toString().replaceAll(RegExp(r'\n'), ' '),
    );
  }
}
