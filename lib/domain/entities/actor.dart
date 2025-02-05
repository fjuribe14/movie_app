class Actor {
  int id;
  bool adult;
  int gender;
  String name;
  String imdbId;
  String biography;
  double popularity;
  String profilePath;
  List<String> alsoKnownAs;
  String knownForDepartment;

  Actor({
    required this.id,
    required this.name,
    required this.adult,
    required this.gender,
    required this.imdbId,
    required this.biography,
    required this.popularity,
    required this.profilePath,
    required this.alsoKnownAs,
    required this.knownForDepartment,
  });
}
