import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/pokemonModel.dart';

class PokemonService {
  final _random = Random();
  final int maxPokemonId = 151; // Limiting to the original 151 Pokémon

  /// Fetches a random Pokémon from the PokeAPI with fallback data.
  Future<Pokemon> fetchRandomPokemon() async {
    try {
      final int id = _random.nextInt(maxPokemonId) + 1;
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'),
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'PokemonApp/1.0',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        return Pokemon.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, use fallback data.
        print('API returned status code: ${response.statusCode}, using fallback data');
        return _getFallbackPokemon();
      }
    } catch (e) {
      // If any network error occurs, use fallback data.
      print('Network error: $e, using fallback data');
      return _getFallbackPokemon();
    }
  }

  /// Provides fallback Pokémon data when the API is unavailable.
  Pokemon _getFallbackPokemon() {
    final fallbackPokemon = [
      {
        'id': 25,
        'name': 'pikachu',
        'height': 40,
        'weight': 60,
        'sprites': {
          'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'
        },
        'types': [
          {'type': {'name': 'electric'}}
        ]
      },
      {
        'id': 1,
        'name': 'bulbasaur',
        'height': 70,
        'weight': 69,
        'sprites': {
          'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'
        },
        'types': [
          {'type': {'name': 'grass'}},
          {'type': {'name': 'poison'}}
        ]
      },
      {
        'id': 4,
        'name': 'charmander',
        'height': 60,
        'weight': 85,
        'sprites': {
          'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png'
        },
        'types': [
          {'type': {'name': 'fire'}}
        ]
      },
      {
        'id': 7,
        'name': 'squirtle',
        'height': 50,
        'weight': 90,
        'sprites': {
          'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png'
        },
        'types': [
          {'type': {'name': 'water'}}
        ]
      },
      {
        'id': 150,
        'name': 'mewtwo',
        'height': 200,
        'weight': 1220,
        'sprites': {
          'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png'
        },
        'types': [
          {'type': {'name': 'psychic'}}
        ]
      }
    ];

    final randomPokemon = fallbackPokemon[_random.nextInt(fallbackPokemon.length)];
    return Pokemon.fromJson(randomPokemon);
  }
}
