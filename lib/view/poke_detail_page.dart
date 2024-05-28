import 'package:flutter/material.dart';

class PokeDetailPage extends StatelessWidget {
  const PokeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pokémon'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const SingleChildScrollView(),
    );
  }
}
