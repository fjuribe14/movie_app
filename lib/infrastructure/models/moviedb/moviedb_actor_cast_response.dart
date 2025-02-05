import 'package:new_app/infrastructure/models/models.dart';

class ActorCastDbMoviesResponse {
  int id;
  List<CastDBMovie> cast;
  List<CastDBMovie> crew;

  ActorCastDbMoviesResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory ActorCastDbMoviesResponse.fromJson(Map<String, dynamic> json) =>
      ActorCastDbMoviesResponse(
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
