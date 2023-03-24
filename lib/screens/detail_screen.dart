import 'package:flutter/material.dart';
import 'package:peliculas/widgets/casting_cards.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'No-Movie';

    return const Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppbar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            _PosterAndtitle(),
            _OverView(),
            _OverView(),
            _OverView(),
            CastingCards(),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 5),
          child: const Text('Movie.tilte'),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://www.mountaineers.org/images/placeholder-images/placeholder-300-x-400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndtitle extends StatelessWidget {
  const _PosterAndtitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://dummyimage.com/200x300/'),
                height: 150,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.title',
                style: textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie-vote.average',
                    style: textTheme.bodySmall,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
          'Commodo qui est occaecat mollit magna minim est aute aliquip ut in. Magna in ipsum non fugiat eu deserunt ex dolor adipisicing reprehenderit officia fugiat minim nulla. Aute adipisicing non aute dolor cillum aliquip Lorem Lorem. Excepteur est nostrud proident nulla. Deserunt ipsum nisi eu magna aliquip aliquip minim qui ad veniam commodo.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
