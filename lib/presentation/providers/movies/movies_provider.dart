import 'package:get/get.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/domain/repositories/movies_repository.dart';

class MoviesProvider extends GetxController {
  final RxBool isLoading = true.obs;
  final MoviesRepository moviesRepository;
  final RxList<Cast> casts = <Cast>[].obs;
  final RxList<Movie> movies = <Movie>[].obs;
  final Rx<Movie> movie = Movie(
    id: 0,
    title: '',
    video: false,
    adult: false,
    overview: '',
    voteCount: 0,
    popularity: 0.0,
    posterPath: '',
    voteAverage: 0.0,
    backdropPath: '',
    originalTitle: '',
    originalLanguage: '',
  ).obs;

  MoviesProvider({required this.moviesRepository});

  @override
  void onInit() {
    super.onInit();
    loadPage();
  }

  Future<void> loadPage() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final data = await moviesRepository.getLatestMovies(page: 1);

    movies.value = data;
    movies.refresh();

    isLoading.value = false;
  }

  Future<List<Cast>> getCast({required int movieID}) async {
    if (casts.isNotEmpty && casts.any((e) => e.id == movieID)) {
      return casts;
    }

    final data = await moviesRepository.getMovieCast(movieID: movieID);

    casts.value = data;
    casts.refresh();

    return data;
  }
}
