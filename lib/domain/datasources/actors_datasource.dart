import 'package:new_app/domain/entities/entities.dart';

abstract class ActorsDatasource {
  Future<Actor> getActorById({required int actorID});

  Future<List<ActorCast>> getActorMovies({required int actorID});
}
