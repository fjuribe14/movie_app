import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String appName = dotenv.env['APP_NAME'] ?? '';

  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
  static String apiToken = dotenv.env['API_TOKEN'] ?? '';
  static String apiLanguage = dotenv.env['API_LANGUAGE'] ?? '';

  static String urlLatestMovies = dotenv.env['URL_LATEST_MOVIES'] ?? '';
  static String urlMovieCredits = dotenv.env['URL_MOVIE_CREDITS'] ?? '';
  static String urlMovieImageSource =
      dotenv.env['URL_MOVIE_IMAGE_SOURCE'] ?? '';

  static String urlImageNotFound = dotenv.env['URL_IMAGE_NOT_FOUND'] ?? '';
}
