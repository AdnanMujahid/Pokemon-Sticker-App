import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemonModel.dart';
import 'package:pokemon_app/pokemonService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Pokemon> _futurePokemon;

  @override
  void initState() {
    super.initState();
    // Initialize the future to fetch a Pokémon on app start.
    _futurePokemon = PokemonService().fetchRandomPokemon();
  }

  /// Refreshes the future to fetch a new random Pokémon.
  void _fetchNewPokemon() {
    setState(() {
      _futurePokemon = PokemonService().fetchRandomPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon App'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<Pokemon>(
          future: _futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show loading indicator.
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show error message.
            } else if (snapshot.hasData) {
              final pokemon = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    pokemon.sprites.frontDefault,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _fetchNewPokemon,
                    child: const Text('Catch Another!'),
                  ),
                ],
              );
            } else {
              return const Text('No Pokémon data available.');
            }
          },
        ),
      ),
    );
  }
}
