import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:new_app/presentation/screens/screens.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LatestMoviesGridData extends StatelessWidget {
  const LatestMoviesGridData({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MoviesProvider>();

    return MasonryGridView.extent(
      shrinkWrap: true,
      crossAxisSpacing: 26,
      maxCrossAxisExtent: 200.0,
      itemCount: ctrl.movies.length,
      padding: const EdgeInsets.all(26),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FadeInUp(
          duration: Duration(milliseconds: 200 * index),
          child: GestureDetector(
            onTap: () {
              ctrl.movie.value = ctrl.movies[index];
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
                  image: CachedNetworkImageProvider(
                      ctrl.movies[index].posterPath,
                      cacheKey: ctrl.movies[index].posterPath),
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
                      ctrl.movies[index].title,
                      style: TextStyle(
                        fontFamily: 'Baloo',
                        color: Get.theme.colorScheme.onPrimary,
                        fontSize: Get.textTheme.titleMedium!.fontSize,
                      ),
                    ),
                    Text(
                      '${(ctrl.movies[index].voteAverage)}% User Score',
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
