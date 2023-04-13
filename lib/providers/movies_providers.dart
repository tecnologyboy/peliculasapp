import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  // si no se extiende de la clase Change Nofitiers no sera admitido como un provider valido

  final String _language = 'es-ES';
  final String _urlBase = 'api.themoviedb.org';
  final String _apiKey = '242ff1e9ef9237a371520c33ca9f64aa';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggetsionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggetionStream => _suggetsionStreamController.stream;

  Future<String> _getJsonDate(String endpoint, [int page = 1]) async {
    final url = Uri.https(_urlBase, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);

    return response.body;
  }

  MoviesProvider() {
    print('Movies Provider Inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonDate('/3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); //Este metodo, hace que todos los widgets que estan utilizando los datos que tienen cambios, se redibujen automaticamente.
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonDate('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners(); //Este metodo, hace que todos los widgets que estan utilizando los datos que tienen cambios, se redibujen automaticamente.
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonDate('/3/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> seachMovies(String query) async {
    final url = Uri.https(_urlBase, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});

    final response = await http.get(url);

    final searchResponse = SearchResponse.fromRawJson(response.body);

    return searchResponse.results;
  }

  void getSuggetionQuery(String query) {}
}
