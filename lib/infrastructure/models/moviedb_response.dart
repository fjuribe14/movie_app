import 'package:new_app/infrastructure/models/moviedb_movie_model.dart';

class MovieDBResponse {
  int page;
  int totalPages;
  int totalResults;
  List<MovieDBMovie> results;

  MovieDBResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieDBResponse.fromJson(Map<String, dynamic> json) =>
      MovieDBResponse(
        page: json["page"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
        results: List<MovieDBMovie>.from(
            json["results"].map((x) => MovieDBMovie.fromJson(x))),
      );
}
