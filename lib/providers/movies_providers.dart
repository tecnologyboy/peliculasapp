import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  // si no se extiende de la clase Change Nofitiers no sera admitido como un provider valido

  final String _language = 'es-ES';
  final String _urlBase = 'api.themoviedb.org';
  final String _apiKey = '242ff1e9ef9237a371520c33ca9f64aa';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('Movies Provider Inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_urlBase, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);

    this.onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); //Este metodo, hace que todos los widgets que estan utilizando los datos que tienen cambios, se redibujen automaticamente.
  }

  getPopularMovies() async {
    var url = Uri.https(_urlBase, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final popularResponse = PopularResponse.fromRawJson(response.body);

    this.popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners(); //Este metodo, hace que todos los widgets que estan utilizando los datos que tienen cambios, se redibujen automaticamente.
  }
}
