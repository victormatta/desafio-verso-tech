import 'package:flutter/material.dart';
import 'package:poke_verso/components/poke_card.dart';
import 'package:poke_verso/view-model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

enum FilterType { Favorite, All }

class PokeOverViewPage extends StatelessWidget {
  const PokeOverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokeViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterType.Favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterType.All,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterType selectedValue) {
              if (selectedValue == FilterType.Favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
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
