import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_app/presentation/providers/actors/actors_provider.dart';
import 'package:new_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:new_app/infrastructure/datasources/moviedb_actors_datasource.dart';

class ActorDetails extends StatelessWidget {
  static const screenName = '/actor_details';

  const ActorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ActorsProvider ctrl = Get.find<ActorsProvider>();
    ScrollController scrollController = ScrollController();

    final actorsRepositoryImpl =
        ActorRepositoryImpl(actorsDatasource: MoviedbActorsDatasource());

    ctrl.getActorById(actorID: ctrl.actorID.value);

    return GetBuilder<ActorsProvider>(
      init: ActorsProvider(actorsRepository: actorsRepositoryImpl),
      builder: (ctrl) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                CustomAppbar(type: CustomAppbarType.back),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) {
                      return Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: Column(
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
                                    ),
                                    radius: 43,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ctrl.actor.value.name,
                                        style: TextStyle(
                                          fontFamily: 'Baloo',
                                          fontSize: Get.textTheme.headlineLarge!
                                              .fontSize,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        ctrl.actor.value.biography,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'Baloo 2',
                                          fontSize: Get
                                              .textTheme.titleMedium!.fontSize,
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Text(
                      'Casted on',
                      style: TextStyle(
                        fontFamily: 'Baloo',
                        fontSize: Get.textTheme.displayMedium!.fontSize,
                      ),
                    ),
                  ),
                )),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: 1, (context, index) => LatestMoviesGrid()))
              ],
            ),
          ),
        );
      },
    );
  }
}
