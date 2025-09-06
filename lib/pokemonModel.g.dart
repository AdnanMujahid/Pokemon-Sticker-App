// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String,
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'sprites': instance.sprites,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      frontDefault: json['front_default'] as String,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
    };
