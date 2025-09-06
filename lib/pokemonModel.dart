import 'package:json_annotation/json_annotation.dart';

part 'pokemonModel.g.dart';

@JsonSerializable()
class Pokemon {
  final String name;
  final Sprites sprites;

  Pokemon({required this.name, required this.sprites});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  final String frontDefault;

  Sprites({required this.frontDefault});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
