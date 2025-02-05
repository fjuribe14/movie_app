import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/widgets/widgets.dart';
import 'package:new_app/presentation/providers/providers.dart';

class ActorMoviesGrid extends StatelessWidget {
  const ActorMoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ActorsProvider>();

    return Obx(() => ctrl.actor.value.id != ctrl.actorID.value
        ? ActorMoviesSkeleton()
        : ActorMoviesData(movies: ctrl.movies));
  }
}
