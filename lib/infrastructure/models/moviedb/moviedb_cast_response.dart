import 'dart:convert';

import 'package:new_app/infrastructure/models/moviedb/moviedb_cast_model.dart';

class CastResponse {
  int id;
  List<CastDBMovie> cast;
  List<CastDBMovie> crew;

  CastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastResponse.fromRawJson(String str) =>
      CastResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CastResponse.fromJson(Map<String, dynamic> json) => CastResponse(
        id: json["id"],
        cast: List<CastDBMovie>.from(
            json["cast"].map((x) => CastDBMovie.fromJson(x))),
        crew: List<CastDBMovie>.from(
            json["crew"].map((x) => CastDBMovie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}
