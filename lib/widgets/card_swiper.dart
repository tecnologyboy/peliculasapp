import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.red, //se coloco inicialmente este color para configurar el widget
      child: Swiper(
        //reemplace un container por un sizebox, por que flutter se paso de inteligente y me lo sugirio
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * .47,
        itemBuilder: (_, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail',
                  arguments: 'movieinstance');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
