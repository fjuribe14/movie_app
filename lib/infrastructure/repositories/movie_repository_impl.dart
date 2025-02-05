import 'package:new_app/domain/entities/entities.dart';
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
  Future<List<Cast>> getMovieCast({required int movieID}) {
    return moviesDatasource.getMovieCast(movieID: movieID);
  }
}
