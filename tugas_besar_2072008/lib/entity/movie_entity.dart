import 'genre_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';
part 'movie_entity.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String poster_path,
    required String backdrop_path,
    required int id,
    required String title,
    required String overview,
    required String release_date,
    required double vote_average,
    @Default([]) List<Genre> genres,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
