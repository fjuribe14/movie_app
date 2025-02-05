import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/domain/repositories/actors_repository.dart';

class ActorsProvider extends GetxController {
  final RxInt actorID = 0.obs;
  final RxBool isLoading = true.obs;
  final RxList<ActorCast> movies = <ActorCast>[].obs;

  late Rx<Actor> actor = emptyActor.obs;

  final ActorsRepository actorsRepository;

  ActorsProvider({required this.actorsRepository});

  Actor get emptyActor => Actor(
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
      );

  Future<void> getActorById({required int actorID}) async {
    try {
      final data = await actorsRepository.getActorById(actorID: actorID);
      final dataMovies =
          await actorsRepository.getActorMovies(actorID: actorID);

      actor.value = data;
      movies.value = dataMovies;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> getActorMovies({required int actorID}) async {
    try {
      movies.value = [];

      final data = await actorsRepository.getActorMovies(actorID: actorID);

      movies.value = data;
    } catch (e) {
      debugPrint('$e');
    }
  }
}
