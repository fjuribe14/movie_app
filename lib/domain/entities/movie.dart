class Movie {
  int id;
  bool video;
  bool adult;
  String title;
  int voteCount;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  String backdropPath;
  String originalTitle;
  String originalLanguage;

  Movie({
    required this.id,
    required this.title,
    required this.video,
    required this.adult,
    required this.overview,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });
}
