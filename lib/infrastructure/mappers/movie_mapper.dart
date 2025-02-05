import 'package:get/get.dart';
import 'package:new_app/config/config.dart';
import 'package:new_app/domain/entities/movie.dart';
import 'package:new_app/infrastructure/models/moviedb/moviedb_movie_model.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieDBMovie moviedb) => Movie(
        id: moviedb.id,
        title: moviedb.title,
        video: moviedb.video,
        adult: moviedb.adult,
        overview: moviedb.overview,
        voteCount: moviedb.voteCount,
        popularity: moviedb.popularity,
        posterPath: [null, ''].contains(moviedb.posterPath)
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${moviedb.posterPath}',
        voteAverage: (moviedb.voteAverage * 10).toPrecision(2),
        backdropPath: [null, ''].contains(moviedb.backdropPath)
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${moviedb.backdropPath}',
        originalTitle: moviedb.originalTitle,
        originalLanguage: moviedb.originalLanguage,
      );
}
