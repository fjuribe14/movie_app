import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/domain/datasources/actors_datasource.dart';
import 'package:new_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource actorsDatasource;

  ActorRepositoryImpl({required this.actorsDatasource});
  @override
  Future<Actor> getActorById({required int actorID}) {
    return actorsDatasource.getActorById(actorID: actorID);
  }

  @override
  Future<List<Cast>> getActorMovies({required int actorID}) {
    return actorsDatasource.getActorMovies(actorID: actorID);
  }
}
