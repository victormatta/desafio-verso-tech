import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_verso/exceptions/http_exception.dart';
import 'package:poke_verso/model/poke_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class PokeViewModel extends ChangeNotifier {
  final _url = 'https://pokeapi.co/api/v2/pokemon?limit=68';
  List<PokeModel> _pokemon = [];
  bool _showFavoriteOnly = false;
  String? errorMessage;

  List<PokeModel> get pokemon {
    if (_showFavoriteOnly) {
      return _pokemon.where((pok) => pok.isFavorite!).toList();
    } else {
      return [..._pokemon];
    }
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void _toggleFavorite(PokeModel pokemon) {
    pokemon.isFavorite = !pokemon.isFavorite!;
    notifyListeners();
  }

  void toggleFavorite(PokeModel pokemon) {
    final pokeIndex = _pokemon.indexWhere((pok) => pok.id == pokemon.id);

    if (pokeIndex >= 0) {
      _toggleFavorite(pokemon);
    }
  }

  int get itemsCount {
    return _pokemon.length;
  }

  Future<void> getPokemon() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        final List<PokeModel> loadedPokemon = [];

        for (var pokemon in data) {
          final pokemonDetails = await http.get(Uri.parse(pokemon['url']));
          if (pokemonDetails.statusCode == 200) {
            loadedPokemon
                .add(PokeModel.fromJson(jsonDecode(pokemonDetails.body)));
          } else {
            throw HttpException(
              msg:
                  'Erro ao obter dados dos Pokémon: ${pokemonDetails.statusCode}',
              statusCode: pokemonDetails.statusCode,
            );
          }
        }
        _pokemon = loadedPokemon;
        errorMessage = null;
        notifyListeners();
      } else {
        throw HttpException(
          msg: 'Não foi possível carregar os Pokemon na tela',
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      errorMessage = error.toString();
      notifyListeners();
    }
  }

  void removeSinglePokemon(int id) {
    final pokeIndex = _pokemon.indexWhere((pok) => pok.id == id);

    if (pokeIndex >= 0) {
      _pokemon[pokeIndex].isFavorite = false;
      notifyListeners();
    }
  }
}
