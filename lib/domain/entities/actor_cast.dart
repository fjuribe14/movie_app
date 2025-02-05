class ActorCast {
  int id;
  int order;
  bool adult;
  bool video;
  String title;
  int voteCount;
  String creditId;
  String overview;
  String character;
  double popularity;
  String posterPath;
  double voteAverage;
  List<int> genreIds;
  String backdropPath;
  String originalTitle;
  String originalLanguage;

  ActorCast({
    required this.id,
    required this.adult,
    required this.title,
    required this.video,
    required this.order,
    required this.creditId,
    required this.genreIds,
    required this.overview,
    required this.voteCount,
    required this.character,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });
}
