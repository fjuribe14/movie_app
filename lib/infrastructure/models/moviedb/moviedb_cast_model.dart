import 'dart:convert';

class CastDBMovie {
  int id;
  int? order;
  bool adult;
  int gender;
  int? castId;
  String name;
  String? job;
  String creditId;
  double popularity;
  String? character;
  String? department;
  String originalName;
  String? profilePath;
  String knownForDepartment;

  CastDBMovie({
    this.job,
    this.order,
    this.castId,
    this.character,
    this.department,
    required this.id,
    required this.name,
    required this.adult,
    required this.gender,
    required this.creditId,
    required this.popularity,
    required this.profilePath,
    required this.originalName,
    required this.knownForDepartment,
  });

  factory CastDBMovie.fromRawJson(String str) =>
      CastDBMovie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CastDBMovie.fromJson(Map<String, dynamic> json) => CastDBMovie(
        id: json["id"],
        job: json["job"],
        name: json["name"],
        adult: json["adult"],
        order: json["order"],
        gender: json["gender"],
        castId: json["cast_id"],
        creditId: json["credit_id"],
        character: json["character"],
        department: json["department"],
        profilePath: json["profile_path"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        knownForDepartment: json["known_for_department"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job": job,
        "name": name,
        "order": order,
        "adult": adult,
        "gender": gender,
        "cast_id": castId,
        "credit_id": creditId,
        "character": character,
        "department": department,
        "popularity": popularity,
        "profile_path": profilePath,
        "original_name": originalName,
        "known_for_department": knownForDepartment,
      };
}
