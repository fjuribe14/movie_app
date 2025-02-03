import 'package:new_app/domain/entities/movie_feed.dart';

abstract class MovieFeedRepository {
  Future<List<MovieFeed>> getMostPopularMovieFeed({required int page});

  Future<List<MovieFeed>> getByIdMovieFeed({required int movieID});

  Future<List<MovieFeed>> getCreditsMovieFeed({required int movieID});
}
