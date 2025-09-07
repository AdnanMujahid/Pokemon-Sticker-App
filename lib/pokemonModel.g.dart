// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  height: (json['height'] as num).toInt(),
  weight: (json['weight'] as num).toInt(),
  sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
  types: (json['types'] as List<dynamic>)
      .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'height': instance.height,
  'weight': instance.weight,
  'sprites': instance.sprites,
  'types': instance.types,
};

Sprites _$SpritesFromJson(Map<String, dynamic> json) =>
    Sprites(frontDefault: json['front_default'] as String);

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
  'front_default': instance.frontDefault,
};

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) =>
    PokemonType(type: TypeInfo.fromJson(json['type'] as Map<String, dynamic>));

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{'type': instance.type};

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) =>
    TypeInfo(name: json['name'] as String);

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
  'name': instance.name,
};
