import 'package:flutter/material.dart';
import 'package:poke_verso/model/poke_model.dart';
import 'package:poke_verso/utils/routes.dart';
import 'package:provider/provider.dart';

class PokeGridItem extends StatelessWidget {
  const PokeGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<PokeModel>(context, listen: false);
    // final interface = Provider.of<PokeViewModel>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Text('#${pokemon.id}'),
          title: Text(
            pokemon.name,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,
          trailing: const Icon(Icons.favorite),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.POKEMON_DETAIL, arguments: pokemon);
          },
          child: Image.network(
            pokemon.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
