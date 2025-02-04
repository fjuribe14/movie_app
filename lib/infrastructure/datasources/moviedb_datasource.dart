import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_app/domain/entities/movie.dart';
import 'package:new_app/config/constants/environment.dart';
import 'package:new_app/infrastructure/mappers/movie_mapper.dart';
import 'package:new_app/domain/datasources/movies_datasource.dart';
import 'package:new_app/infrastructure/models/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  List<Movie> newMovies = [];

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['API_TOKEN']}',
      },
      queryParameters: {'language': Environment.apiLanguage},
    ),
  );

  @override
  Future<List<Movie>> getLatestMovies({int page = 1}) async {
    final response = await dio
        .get(Environment.urlLatestMovies, queryParameters: {'page': page});

    final movieDBResponse = MovieDBResponse.fromJson(response.data);

    newMovies = movieDBResponse.results
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();

    return newMovies;
  }

  @override
  Future<List<Movie>> getMovieById({required int movieId}) {
    // TODO: implement getMovieById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getMovieCredits({required int movieId}) {
    // TODO: implement getMovieCredits
    throw UnimplementedError();
  }
}
