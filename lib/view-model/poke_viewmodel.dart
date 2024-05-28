import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_verso/model/poke_model.dart';
import 'package:http/http.dart' as http;

class PokeViewModel extends ChangeNotifier {
  List<PokeModel> _pokemon = [];

  List<PokeModel> get pokemon => [..._pokemon];

  int get itemsCount {
    return _pokemon.length;
  }

  Future<void> getPokemon() async {
    try {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=15'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        final List<PokeModel> loadedPokemon = [];

        for (var pokemon in data) {
          final pokemonDetails = await http.get(Uri.parse(pokemon['url']));
          if (pokemonDetails.statusCode == 200) {
            loadedPokemon
                .add(PokeModel.fromJson(jsonDecode(pokemonDetails.body)));
          } else {
            print(
                'Erro ao obter dados dos Pokémon: ${pokemonDetails.statusCode}');
          }
        }
        _pokemon = loadedPokemon;
        notifyListeners();
      } else {
        throw Exception('Falha ao carregar os Pokémon');
      }
    } catch (error) {
      print(error);
    }
  }
}
