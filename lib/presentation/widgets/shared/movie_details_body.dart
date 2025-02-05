import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:new_app/presentation/widgets/shared/movie_cast_scrollview.dart';

class MovieDetailsBody extends StatelessWidget {
  final MoviesProvider ctrl;

  const MovieDetailsBody({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: Get.height * 0.45),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(26),
            constraints: BoxConstraints(minHeight: 100),
            decoration:
                BoxDecoration(color: Colors.black.withValues(alpha: 0.5)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeIn(
                    delay: Duration(milliseconds: 100),
                    child: Text(
                      ctrl.movie.value.title,
                      style: TextStyle(
                        fontFamily: 'Baloo',
                        color: Get.theme.colorScheme.onPrimary,
                        fontSize: Get.textTheme.displayMedium!.fontSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  FadeIn(
                    delay: Duration(milliseconds: 300),
                    child: Text(
                      '${ctrl.movie.value.voteAverage}% User Score',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        color: Get.theme.colorScheme.onPrimary,
                        fontSize: Get.textTheme.titleLarge!.fontSize,
                      ),
                    ),
                  ),
                  if (ctrl.movie.value.overview != '')
                    const SizedBox(height: 12),
                  if (ctrl.movie.value.overview != '')
                    FadeIn(
                      delay: Duration(milliseconds: 500),
                      child: Text(
                        ctrl.movie.value.overview,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Baloo 2',
                          color: Get.theme.colorScheme.onPrimary,
                          fontSize: Get.textTheme.titleMedium!.fontSize,
                        ),
                      ),
                    ),
                  const SizedBox(height: 26),
                  MovieCastScrollview(ctrl: ctrl)
                ]),
          )
        ]);
  }
}
