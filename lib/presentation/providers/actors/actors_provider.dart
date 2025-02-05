import 'package:get/get.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/domain/repositories/actors_repository.dart';

class ActorsProvider extends GetxController {
  final RxInt actorID = 0.obs;
  final RxBool isLoading = true.obs;
  final RxList<Cast> movies = <Cast>[].obs;
  late Rx<Actor> actor = Actor(
    id: 0,
    name: '',
    adult: false,
    gender: 0,
    imdbId: '',
    biography: '',
    popularity: 0.0,
    alsoKnownAs: [],
    profilePath: '',
    knownForDepartment: '',
  ).obs;

  final ActorsRepository actorsRepository;

  ActorsProvider({required this.actorsRepository});

  Future<void> getActorById({required int actorID}) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final data = await actorsRepository.getActorById(actorID: actorID);

    actor.value = data;
    actor.refresh();

    isLoading.value = false;
  }

  Future<void> getActorMovies() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final data = await actorsRepository.getActorMovies(actorID: actorID.value);

    movies.value = data;
    movies.refresh();

    isLoading.value = false;
  }
}
