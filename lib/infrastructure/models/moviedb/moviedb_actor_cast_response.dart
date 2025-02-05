import 'dart:convert';
import 'package:new_app/infrastructure/models/models.dart';

class ActorCastResponseDbMovies {
  int id;
  List<ActorCastDbMovies> cast;

  ActorCastResponseDbMovies({
    required this.id,
    required this.cast,
  });

  factory ActorCastResponseDbMovies.fromRawJson(String str) =>
      ActorCastResponseDbMovies.fromJson(json.decode(str));

  factory ActorCastResponseDbMovies.fromJson(Map<String, dynamic> json) =>
      ActorCastResponseDbMovies(
        id: json["id"],
        cast: List<ActorCastDbMovies>.from(
            json["cast"].map((x) => ActorCastDbMovies.fromJson(x))),
      );
}
