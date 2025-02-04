import 'dart:convert';
import 'package:new_app/domain/entities/movie.dart';

MovieDBMovie movieDBFromJson(String str) =>
    MovieDBMovie.fromJson(json.decode(str));

class MovieDBMovie {
  int id;
  bool adult;
  bool video;
  String title;
  int voteCount;
  String overview;
  double popularity;
  String posterPath;
  List<int> genreIds;
  double voteAverage;
  String backdropPath;
  String originalTitle;
  DateTime releaseDate;
  String originalLanguage;

  MovieDBMovie({
    required this.id,
    required this.adult,
    required this.title,
    required this.video,
    required this.genreIds,
    required this.overview,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });

  factory MovieDBMovie.fromJson(Map<String, dynamic> json) => MovieDBMovie(
        id: json["id"],
        title: json["title"],
        video: json["video"],
        adult: json["adult"] ?? false,
        voteCount: json["vote_count"],
        overview: json["overview"] ?? "",
        originalTitle: json["original_title"],
        posterPath: json["poster_path"] ?? "",
        backdropPath: json["backdrop_path"] ?? "",
        popularity: json["popularity"]?.toDouble(),
        originalLanguage: json["original_language"],
        voteAverage: json["vote_average"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Movie toMovieEntity() => Movie(
        id: id,
        title: title,
        video: video,
        adult: adult,
        overview: overview,
        genreIds: genreIds,
        voteCount: voteCount,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        voteAverage: voteAverage,
        backdropPath: backdropPath,
        originalTitle: originalTitle,
        originalLanguage: originalLanguage,
      );
}
