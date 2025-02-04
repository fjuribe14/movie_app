import 'package:new_app/config/config.dart';
import 'package:new_app/domain/entities/movie.dart';
import 'package:new_app/infrastructure/models/moviedb_movie_model.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieDBMovie moviedb) => Movie(
        id: moviedb.id,
        title: moviedb.title,
        video: moviedb.video,
        adult: moviedb.adult,
        overview: moviedb.overview,
        genreIds: moviedb.genreIds.map((e) => e).toList(),
        voteCount: moviedb.voteCount,
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath == ''
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${moviedb.posterPath}',
        releaseDate: moviedb.releaseDate,
        voteAverage: moviedb.voteAverage,
        backdropPath: moviedb.backdropPath == ''
            ? Environment.urlImageNotFound
            : '${Environment.urlMovieImageSource}${moviedb.backdropPath}',
        originalTitle: moviedb.originalTitle,
        originalLanguage: moviedb.originalLanguage,
      );
}
