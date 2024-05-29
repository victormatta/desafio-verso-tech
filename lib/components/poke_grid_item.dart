import 'package:flutter/material.dart';
import 'package:poke_verso/model/poke_model.dart';
import 'package:poke_verso/utils/routes.dart';
import 'package:poke_verso/view-model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

class PokeGridItem extends StatelessWidget {
  const PokeGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<PokeModel>(context, listen: false);
    final interface = Provider.of<PokeViewModel>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Text(
            '#${pokemon.id}',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          title: Text(
            pokemon.name,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,
          trailing: Consumer<PokeModel>(
            builder: (context, pokemon, _) => IconButton(
              onPressed: () {
                interface.toggleFavorite(pokemon);
              },
              icon: Icon(
                  pokemon.isFavorite! ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
            ),
          ),
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
