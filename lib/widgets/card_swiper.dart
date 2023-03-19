import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.red, //se coloco inicialmente este color para configurar el widget
      child: Swiper(
        //reemplace un container por un sizebox, por que flutter se paso de inteligente y me lo sugirio
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * .47,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail',
                  arguments: 'movieinstance');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                    'https://www.mountaineers.org/images/placeholder-images/placeholder-300-x-400'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
