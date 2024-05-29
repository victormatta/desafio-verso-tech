import 'package:flutter/material.dart';

class PokeModel with ChangeNotifier {
  final int id;
  final String name;
  final String imageUrl;
  final double height;
  final double weight;
  final List<String> types;
  final List<String> abilities;
  bool? isFavorite;

  PokeModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    this.isFavorite = false,
  });

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    return PokeModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['home']['front_default'],
      height: json['height'] / 10,
      weight: json['weight'] / 10,
      types: (json['types'] as List)
          .map((typeInfo) => typeInfo['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((abilityInfo) => abilityInfo['ability']['name'] as String)
          .toList(),
    );
  }
}
