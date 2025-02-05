import 'dart:convert';

class ActorCastDbMovies {
  int id;
  int order;
  bool adult;
  bool video;
  String title;
  int voteCount;
  String overview;
  String creditId;
  String character;
  double popularity;
  String posterPath;
  double voteAverage;
  List<int> genreIds;
  String backdropPath;
  String originalTitle;
  String originalLanguage;

  ActorCastDbMovies({
    required this.id,
    required this.order,
    required this.adult,
    required this.title,
    required this.video,
    required this.genreIds,
    required this.overview,
    required this.creditId,
    required this.character,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });

  factory ActorCastDbMovies.fromRawJson(String str) =>
      ActorCastDbMovies.fromJson(json.decode(str));

  factory ActorCastDbMovies.fromJson(Map<String, dynamic> json) =>
      ActorCastDbMovies(
        id: json["id"],
        adult: json["adult"],
        title: json["title"],
        video: json["video"],
        order: json["order"],
        overview: json["overview"],
        creditId: json["credit_id"],
        character: json["character"],
        voteCount: json["vote_count"],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"] ?? '',
        backdropPath: json["backdrop_path"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        originalLanguage: json["original_language"],
        voteAverage: json["vote_average"]?.toDouble(),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );
}
