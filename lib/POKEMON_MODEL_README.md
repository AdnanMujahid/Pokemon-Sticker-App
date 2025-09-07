# Pokemon Model Documentation

## Overview
The Pokemon model is designed to represent Pokemon data from the PokeAPI in a clean, well-documented way that's easy to understand and use.

## Model Structure

### Pokemon Class
The main class that represents a complete Pokemon with all its information.

**Fields:**
- `id` (int): Unique identifier (e.g., 1 for Bulbasaur, 25 for Pikachu)
- `name` (String): Pokemon name in lowercase (e.g., "pikachu", "charizard")
- `height` (int): Height in decimeters (40 = 4.0 meters)
- `weight` (int): Weight in hectograms (60 = 6.0 kilograms)
- `sprites` (Sprites): Visual images of the Pokemon
- `types` (List<PokemonType>): Pokemon types (1-2 types per Pokemon)

**Helper Methods:**
- `heightInMeters`: Converts height to meters (height / 10.0)
- `weightInKilograms`: Converts weight to kilograms (weight / 10.0)
- `capitalizedName`: Returns name with proper capitalization
- `typeNames`: Returns list of type names as strings
- `typesString`: Returns formatted types string (e.g., "FIRE / FLYING")

### Sprites Class
Represents the visual sprites/images of a Pokemon.

**Fields:**
- `frontDefault` (String): URL to the default front-facing sprite image

### PokemonType Class
Represents a Pokemon's type information.

**Fields:**
- `type` (TypeInfo): The actual type information

### TypeInfo Class
Contains the core type information.

**Fields:**
- `name` (String): Type name (e.g., "electric", "fire", "water")

**Helper Methods:**
- `capitalizedName`: Returns type name with proper capitalization

## Usage Examples

```dart
// Creating a Pokemon from JSON (usually from API)
Pokemon pokemon = Pokemon.fromJson(jsonData);

// Accessing Pokemon information
print(pokemon.capitalizedName); // "Pikachu"
print(pokemon.heightInMeters); // 0.4 (for Pikachu)
print(pokemon.weightInKilograms); // 6.0 (for Pikachu)
print(pokemon.typesString); // "ELECTRIC"

// Accessing type information
for (PokemonType pokemonType in pokemon.types) {
  print(pokemonType.type.capitalizedName); // "Electric"
}
```

## JSON Serialization
The model uses `json_annotation` for automatic JSON serialization:
- `fromJson()`: Creates Pokemon from JSON data
- `toJson()`: Converts Pokemon to JSON data

The generated code is in `pokemonModel.g.dart` and should be regenerated whenever the model changes using:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Type Colors
The UI includes a color mapping for Pokemon types:
- Fire: Red (#ff6b6b)
- Water: Teal (#4ecdc4)
- Grass: Blue (#45b7d1)
- Electric: Yellow (#f9ca24)
- And many more...

This makes it easy to create visually appealing type indicators in the UI.

