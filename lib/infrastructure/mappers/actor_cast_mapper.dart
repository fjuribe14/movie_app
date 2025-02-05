import 'package:new_app/config/config.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/infrastructure/models/models.dart';

class ActorCastMapper {
  static ActorCast actorMovieCastDBToCast(ActorCastDbMovies actordb) =>
      ActorCast(
        id: actordb.id,
        adult: actordb.adult,
        title: actordb.title,
        video: actordb.video,
        order: actordb.order,
        creditId: actordb.creditId,
        genreIds: actordb.genreIds,
        overview: actordb.overview,
        voteCount: actordb.voteCount,
        character: actordb.character,
        popularity: actordb.popularity,
        posterPath: [null, ''].contains(actordb.posterPath)
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${actordb.posterPath}',
        voteAverage: actordb.voteAverage,
        backdropPath: [null, ''].contains(actordb.backdropPath)
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${actordb.backdropPath}',
        originalTitle: actordb.originalTitle,
        originalLanguage: actordb.originalLanguage,
      );
}
