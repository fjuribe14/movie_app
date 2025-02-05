import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/infrastructure/models/models.dart';
import 'package:new_app/config/constants/environment.dart';
import 'package:new_app/infrastructure/mappers/cast_mapper.dart';
import 'package:new_app/infrastructure/mappers/movie_mapper.dart';
import 'package:new_app/domain/datasources/movies_datasource.dart';

class MoviedbMoviesDatasource extends MoviesDatasource {
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
    List<Movie> movies = [];

    final response = await dio
        .get(Environment.urlLatestMovies, queryParameters: {'page': page});

    final movieDBResponse = MovieDBResponse.fromJson(response.data);

    movies = movieDBResponse.results
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();

    return movies;
  }

  @override
  Future<List<Cast>> getMovieCast({required int movieID}) async {
    List<Cast> cast = [];

    final response =
        await dio.get('${Environment.urlMovieCredits}/$movieID/credits');

    final movieDBResponse = CastResponse.fromJson(response.data);

    cast = movieDBResponse.cast
        .map((e) => CastMapper.castsMovieDBToCast(e))
        .toList();

    return cast;
  }
}
