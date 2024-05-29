import 'package:flutter/material.dart';
import 'package:poke_verso/components/poke_details_widget.dart';
// import 'package:poke_verso/model/poke_model.dart';

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
      body: const SingleChildScrollView(child: PokeDetailsWidget()),
    );
  }
}
