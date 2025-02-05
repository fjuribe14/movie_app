import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/config/config.dart';
import 'package:new_app/presentation/widgets/widgets.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetails extends StatelessWidget {
  static const screenName = '/movie_details';

  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesProvider ctrl = Get.find<MoviesProvider>();

    ctrl.getCast(movieID: ctrl.movie.value.id);

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            image: CachedNetworkImageProvider(
              ctrl.movie.value.posterPath,
              cacheKey: ctrl.movie.value.posterPath,
              errorListener: (p0) {
                ctrl.movie.value.posterPath = Environment.urlImageNotFound;
              },
            ),
          ),
        ),
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black]),
          ),
          child: CustomScrollView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            slivers: [
              CustomAppbar(type: CustomAppbarType.close),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => MovieDetailsBody(ctrl: ctrl),
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
