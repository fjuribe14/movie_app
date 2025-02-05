import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_app/presentation/widgets/shared/actor/actor_info_skeleton.dart';

class ActorInfo extends StatelessWidget {
  final ActorsProvider ctrl;

  const ActorInfo({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.actor.value.id != ctrl.actorID.value) {
        return ActorInfoSkeleton(ctrl: ctrl);
      }

      if (ctrl.movies.isEmpty) {
        return const Center(child: Text('Actor movies not found'));
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  ctrl.actor.value.profilePath,
                  cacheKey: ctrl.actor.value.profilePath,
                ),
                radius: 43,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ctrl.actor.value.name,
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: Get.textTheme.headlineLarge!.fontSize,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    ctrl.actor.value.biography,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: Get.textTheme.titleMedium!.fontSize,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      );
    });
  }
}
