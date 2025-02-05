import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:new_app/domain/entities/entities.dart';
import 'package:new_app/presentation/screens/screens.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ActorMoviesData extends StatelessWidget {
  final List<ActorCast> movies;

  const ActorMoviesData({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MoviesProvider>();

    return MasonryGridView.extent(
      shrinkWrap: true,
      crossAxisSpacing: 26,
      maxCrossAxisExtent: 200.0,
      itemCount: movies.length,
      padding: const EdgeInsets.all(26),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return FadeInUp(
          duration: Duration(milliseconds: 200 * index),
          child: GestureDetector(
            onTap: () {
              ctrl.movie.value = Movie(
                id: movie.id,
                title: movie.title,
                video: movie.video,
                adult: movie.adult,
                overview: movie.overview,
                voteCount: movie.voteCount,
                popularity: movie.popularity,
                posterPath: movie.posterPath,
                voteAverage: movie.voteAverage,
                backdropPath: movie.backdropPath,
                originalTitle: movie.originalTitle,
                originalLanguage: movie.originalLanguage,
              );
              Get.toNamed(MovieDetails.screenName);
            },
            child: Container(
              height: Get.height * 0.3,
              clipBehavior: Clip.hardEdge,
              margin: index % 2 == 0
                  ? EdgeInsets.only(bottom: 26)
                  : EdgeInsets.only(top: 26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.theme.colorScheme.surfaceContainerHigh,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(movies[index].posterPath,
                      cacheKey: movies[index].posterPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                    color: Get.theme.colorScheme.shadow.withValues(alpha: 0.3),
                  ),
                ],
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
                      movies[index].title,
                      style: TextStyle(
                        fontFamily: 'Baloo',
                        color: Get.theme.colorScheme.onPrimary,
                        fontSize: Get.textTheme.titleMedium!.fontSize,
                      ),
                    ),
                    Text(
                      '${(movies[index].voteAverage)}% User Score',
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Get.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
