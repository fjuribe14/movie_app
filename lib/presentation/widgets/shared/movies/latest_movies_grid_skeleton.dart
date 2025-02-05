import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LatestMoviesGridSkeleton extends StatelessWidget {
  const LatestMoviesGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.extent(
      itemCount: 20,
      shrinkWrap: true,
      crossAxisSpacing: 26,
      maxCrossAxisExtent: 200.0,
      padding: const EdgeInsets.all(26),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: Get.height * 0.3,
          clipBehavior: Clip.hardEdge,
          margin: index % 2 == 0
              ? EdgeInsets.only(bottom: 26)
              : EdgeInsets.only(top: 26),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.theme.colorScheme.surfaceContainerLowest,
              boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                    color: Get.theme.colorScheme.shadow.withValues(alpha: 0.1))
              ]),
          child: Shimmer.fromColors(
              baseColor: Get.theme.colorScheme.surfaceContainer,
              highlightColor: Get.theme.colorScheme.surfaceContainerHighest,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Get.theme.colorScheme.surfaceContainerLowest)),
        );

        // );
      },
    );
  }
}
