import 'package:new_app/domain/entities/entities.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getLatestMovies({int page = 1});

  Future<List<Cast>> getMovieCast({required int movieID});
}
