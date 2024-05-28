import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const PokeApp());

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: const MaterialApp(
        title: 'Poke Flutter',
        routes: {},
      ),
    );
  }
}
