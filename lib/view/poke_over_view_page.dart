import 'package:flutter/material.dart';
import 'package:poke_verso/components/poke_card.dart';
import 'package:poke_verso/view-model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

class PokeOverViewPage extends StatelessWidget {
  const PokeOverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  'Pokedex',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<PokeViewModel>(context, listen: false)
                  .getPokemon(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.error != null) {
                  return const Center(
                    child: Text('Ocorreu um erro'),
                  );
                } else {
                  return Consumer<PokeViewModel>(
                    builder: (context, pokemon, child) => const PokeCard(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
