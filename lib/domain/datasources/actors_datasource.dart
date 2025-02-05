import 'package:new_app/domain/entities/entities.dart';

abstract class ActorsDatasource {
  Future<Actor> getActorById({required int actorID});

  Future<List<Cast>> getActorMovies({required int actorID});
}
