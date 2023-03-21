import 'package:flutter/material.dart';

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
