import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tugas_besar_2072008/entity/movie_entity.dart';

class MovieServices {
  Future<List<Movie>?> getAllMovieData() async {
    Dio dio = Dio();

    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=86c9b264fe78b458246c60e0630a8e1f');

      List<Movie> movies = (result.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      // log(movies.toString());
      return movies;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Movie?> getDetailMovie(String id) async {
    Dio dio = Dio();

    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/$id?api_key=86c9b264fe78b458246c60e0630a8e1f');

      Movie movie = Movie.fromJson(result.data);
      // log(movies.toString());
      return movie;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<Movie>?> getUpcomingMovieData() async {
    Dio dio = Dio();

    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=86c9b264fe78b458246c60e0630a8e1f');

      List<Movie> movies = (result.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      // log(movies.toString());
      return movies;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
