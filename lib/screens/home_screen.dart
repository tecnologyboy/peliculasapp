import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en Cine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            //Tarjetas Principales
            CardSwiper(),

            //Tarjetas secundarias
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
