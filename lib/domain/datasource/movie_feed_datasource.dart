import 'package:new_app/domain/entities/movie_feed.dart';

abstract class MovieFeedDatasource {
  Future<List<MovieFeed>> getMostPopularMovieFeed({required int page});

  Future<List<MovieFeed>> getByIdMovieFeed({required int movieId});

  Future<List<MovieFeed>> getCreditsMovieFeed({required int movieId});
}
