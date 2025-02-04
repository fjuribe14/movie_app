import 'package:new_app/domain/entities/movie.dart';
import 'package:new_app/domain/datasources/movies_datasource.dart';
import 'package:new_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MovieRepositoryImpl({required this.moviesDatasource});

  @override
  Future<List<Movie>> getLatestMovies({int page = 1}) {
    return moviesDatasource.getLatestMovies(page: page);
  }

  @override
  Future<List<Movie>> getMovieById({required int movieId}) {
    return moviesDatasource.getMovieById(movieId: movieId);
  }

  @override
  Future<List<Movie>> getMovieCredits({required int movieId}) {
    return moviesDatasource.getMovieCredits(movieId: movieId);
  }
}
