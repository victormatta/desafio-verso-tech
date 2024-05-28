import 'package:flutter/material.dart';
import 'package:poke_verso/components/poke_grid_item.dart';
import 'package:poke_verso/model/poke_model.dart';
import 'package:poke_verso/view-model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

class PokeCard extends StatefulWidget {
  // final int index;

  const PokeCard({super.key});

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<PokeViewModel>(context);
    final List<PokeModel> loadedPokemon = manager.pokemon;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: loadedPokemon.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: loadedPokemon[index],
              child: const PokeGridItem(),
            ),
          ),
        ),
      ],
    );
  }
}
