import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  // si no se extiende de la clase Change Nofitiers no sera admitido como un provider valido

  final String _language = 'es-ES';
  final String _urlBase = 'api.themoviedb.org';
  final String _apiKey = '242ff1e9ef9237a371520c33ca9f64aa';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('Movies Provider Inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_urlBase, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);

    // final Map<String, dynamic> DecodeData = json.decode(response.body);

    // if (response.statusCode != 200) return print('Error');

    //print(nowPlayingResponse.results[1].title);

    this.onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); //Este metodo, hace que todos los widgets que estan utilizando los datos que tienen cambios, se redibujen automaticamente.
  }
}
