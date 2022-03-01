import 'package:flutter/material.dart';
import '../../widgets/appBar_widget.dart';
import 'widgets/pokemon_grid_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(children: const [
            AppBarWidget(),
            PokemonGridWidget(),
          ]),
        ),
      ),
    );
  }
}
