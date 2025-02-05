import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/config/constants/environment.dart';
import 'package:new_app/infrastructure/models/models.dart';
import 'package:new_app/infrastructure/mappers/actor_mapper.dart';
import 'package:new_app/domain/datasources/actors_datasource.dart';
import 'package:new_app/infrastructure/mappers/actor_cast_mapper.dart';

class MoviedbActorsDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['API_TOKEN']}',
      },
      queryParameters: {'language': Environment.apiLanguage},
    ),
  );

  @override
  Future<Actor> getActorById({required int actorID}) async {
    Actor actor;

    final response = await dio.get('${Environment.urlPerson}/$actorID');

    actor =
        ActorMapper.actorMovieDBToActor(ActorDbMovies.fromJson(response.data));

    return actor;
  }

  @override
  Future<List<ActorCast>> getActorMovies({required int actorID}) async {
    List<ActorCast> casts = [];

    final response =
        await dio.get('${Environment.urlPerson}/$actorID/movie_credits');

    final movieDBResponse = ActorCastResponseDbMovies.fromJson(response.data);

    casts = movieDBResponse.cast
        .map((e) => ActorCastMapper.actorMovieCastDBToCast(e))
        .toList();

    return casts;
  }
}
