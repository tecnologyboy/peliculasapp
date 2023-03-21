import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'No-Movie';

    return Scaffold(
      body: Center(
        child: Text(movie),
      ),
    );
  }
}
