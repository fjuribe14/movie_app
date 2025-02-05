import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/screens/screens.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:new_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:new_app/infrastructure/datasources/moviedb_actors_datasource.dart';

class MovieCastScrollview extends StatelessWidget {
  final MoviesProvider ctrl;

  const MovieCastScrollview({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    ActorsProvider actorsProvider = Get.put(
      ActorsProvider(
        actorsRepository:
            ActorRepositoryImpl(actorsDatasource: MoviedbActorsDatasource()),
      ),
    );

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          children: ctrl.casts.isEmpty
              ? List.generate(
                  20,
                  (index) => Container(
                    width: 200,
                    height: 500,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                )
              : ctrl.casts
                  .map((e) => GestureDetector(
                        onTap: () {
                          actorsProvider.actorID.value = e.id;
                          actorsProvider.actorID.refresh();

                          Get.toNamed(ActorDetails.screenName);
                        },
                        child: Container(
                          width: 150,
                          height: Get.height * 0.25,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(e.profilePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 9,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.7),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name,
                                  style: Get.textTheme.titleMedium?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
        ),
      );
    });
  }
}
