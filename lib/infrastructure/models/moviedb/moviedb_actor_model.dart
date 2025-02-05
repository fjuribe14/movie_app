import 'dart:convert';

class ActorDbMovies {
  int id;
  bool adult;
  int gender;
  String name;
  String imdbId;
  String biography;
  double popularity;
  String? profilePath;
  List<String> alsoKnownAs;
  String knownForDepartment;

  ActorDbMovies({
    this.profilePath,
    required this.id,
    required this.name,
    required this.adult,
    required this.gender,
    required this.imdbId,
    required this.biography,
    required this.popularity,
    required this.alsoKnownAs,
    required this.knownForDepartment,
  });

  factory ActorDbMovies.fromRawJson(String str) =>
      ActorDbMovies.fromJson(json.decode(str));

  factory ActorDbMovies.fromJson(Map<String, dynamic> json) => ActorDbMovies(
        id: json["id"],
        name: json["name"],
        adult: json["adult"],
        gender: json["gender"],
        imdbId: json["imdb_id"],
        biography: json["biography"],
        profilePath: json["profile_path"],
        popularity: json["popularity"]?.toDouble(),
        knownForDepartment: json["known_for_department"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
      );
}
