import 'package:new_app/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getLatestMovies({int page = 1});

  Future<List<Movie>> getMovieById({required int movieId});

  Future<List<Movie>> getMovieCredits({required int movieId});
}
