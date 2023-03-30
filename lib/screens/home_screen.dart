import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en Cine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Tarjetas Principales
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),

            //Tarjetas secundarias
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () {
                moviesProvider.getPopularMovies();
              },
            ),
          ],
        ),
      ),
    );
  }
}
