import 'package:json_annotation/json_annotation.dart';

part 'pokemonModel.g.dart';

/// Main Pokemon model class that represents a Pokemon with all its basic information.
/// This class uses JSON serialization to easily convert between JSON and Dart objects.
@JsonSerializable()
class Pokemon {
  /// Unique identifier for the Pokemon (e.g., 1 for Bulbasaur, 25 for Pikachu)
  final int id;
  
  /// The name of the Pokemon (e.g., "pikachu", "charizard")
  final String name;
  
  /// Height of the Pokemon in decimeters (1 decimeter = 0.1 meters)
  /// Example: 40 means 4.0 meters tall
  final int height;
  
  /// Weight of the Pokemon in hectograms (1 hectogram = 0.1 kilograms)
  /// Example: 60 means 6.0 kilograms
  final int weight;
  
  /// Visual sprites/images of the Pokemon
  final Sprites sprites;
  
  /// List of Pokemon types (e.g., ["electric"], ["fire", "flying"])
  /// Most Pokemon have 1-2 types
  final List<PokemonType> types;

  /// Constructor for creating a Pokemon instance
  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.types,
  });

  /// Creates a Pokemon instance from JSON data (used when receiving data from API)
  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  /// Converts a Pokemon instance to JSON data (used when sending data to API)
  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  /// Helper method to get Pokemon height in meters
  double get heightInMeters => height / 10.0;

  /// Helper method to get Pokemon weight in kilograms
  double get weightInKilograms => weight / 10.0;

  /// Helper method to get Pokemon name with proper capitalization
  String get capitalizedName {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }

  /// Helper method to get all Pokemon type names as a list
  List<String> get typeNames => types.map((type) => type.type.name).toList();

  /// Helper method to get Pokemon types as a formatted string
  String get typesString => typeNames.join(' / ').toUpperCase();
}

/// Represents the visual sprites/images of a Pokemon
@JsonSerializable()
class Sprites {
  /// Default front-facing sprite image URL
  @JsonKey(name: 'front_default')
  final String frontDefault;

  /// Constructor for creating a Sprites instance
  Sprites({required this.frontDefault});

  /// Creates a Sprites instance from JSON data
  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  /// Converts a Sprites instance to JSON data
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

/// Represents a Pokemon's type information
@JsonSerializable()
class PokemonType {
  /// The actual type information containing the type name
  final TypeInfo type;

  /// Constructor for creating a PokemonType instance
  PokemonType({required this.type});

  /// Creates a PokemonType instance from JSON data
  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);

  /// Converts a PokemonType instance to JSON data
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

/// Represents the core type information with the type name
@JsonSerializable()
class TypeInfo {
  /// The name of the Pokemon type (e.g., "electric", "fire", "water")
  final String name;

  /// Constructor for creating a TypeInfo instance
  TypeInfo({required this.name});

  /// Creates a TypeInfo instance from JSON data
  factory TypeInfo.fromJson(Map<String, dynamic> json) => _$TypeInfoFromJson(json);

  /// Converts a TypeInfo instance to JSON data
  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);

  /// Helper method to get type name with proper capitalization
  String get capitalizedName {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }
}