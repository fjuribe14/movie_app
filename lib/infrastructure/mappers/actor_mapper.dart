import 'package:new_app/config/config.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/infrastructure/models/models.dart';

class ActorMapper {
  static Actor actorMovieDBToActor(ActorDbMovies actordb) => Actor(
        id: actordb.id,
        name: actordb.name,
        adult: actordb.adult,
        gender: actordb.gender,
        imdbId: actordb.imdbId,
        popularity: actordb.popularity,
        alsoKnownAs: actordb.alsoKnownAs,
        knownForDepartment: actordb.knownForDepartment,
        profilePath: [null, ''].contains(actordb.profilePath)
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${actordb.profilePath}',
        biography: actordb.biography,
      );
}
