import 'package:flutter/material.dart';
import 'package:poke_verso/utils/routes.dart';
import 'package:poke_verso/view-model/poke_viewmodel.dart';
import 'package:poke_verso/view/poke_detail_page.dart';
import 'package:poke_verso/view/poke_over_view_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const PokeApp());

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokeViewModel()),
      ],
      child: MaterialApp(
        title: 'Poke Flutter',
        routes: {
          Routes.HOME: (context) => const PokeOverViewPage(),
          Routes.POKEMON_DETAIL: (context) => const PokeDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
