import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/pokemonModel.dart';

class PokemonService {
  final _random = Random();
  final int maxPokemonId = 151; // Limiting to the original 151 Pokémon

  /// Fetches a random Pokémon from the PokeAPI.
  Future<Pokemon> fetchRandomPokemon() async {
    final int id = _random.nextInt(maxPokemonId) + 1;
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load Pokémon data. Status code: ${response.statusCode}');
    }
  }
}
