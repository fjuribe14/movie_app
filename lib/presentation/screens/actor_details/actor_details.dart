import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/widgets/widgets.dart';
import 'package:new_app/presentation/providers/actors/actors_provider.dart';
import 'package:new_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:new_app/infrastructure/datasources/moviedb_actors_datasource.dart';

class ActorDetails extends StatefulWidget {
  static const screenName = '/actor_details';

  const ActorDetails({super.key});

  @override
  State<ActorDetails> createState() => _ActorDetailsState();
}

class _ActorDetailsState extends State<ActorDetails> {
  final ctrl = Get.find<ActorsProvider>();

  ScrollController scrollController = ScrollController();

  final actorsRepositoryImpl =
      ActorRepositoryImpl(actorsDatasource: MoviedbActorsDatasource());

  @override
  void initState() {
    /** Get actor */
    ctrl.getActorById(actorID: ctrl.actorID.value);
    /** Super init */
    super.initState();
  }

  // @override
  // void dispose() {
  //   debugPrint('dispose');

  //   // ctrl.movies.value = [];
  //   // ctrl.actor.value = ctrl.emptyActor;

  //   ctrl.update([ctrl.actor, ctrl.movies]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActorsProvider>(
      autoRemove: false,
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
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: ActorInfo(ctrl: ctrl),
                    ),
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
                          fontSize: Get.textTheme.displayMedium!.fontSize),
                    ),
                  ),
                )),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: 1, (context, index) => ActorMoviesGrid()))
              ],
            ),
          ),
        );
      },
    );
  }
}
