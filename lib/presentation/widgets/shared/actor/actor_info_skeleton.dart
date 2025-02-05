import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/providers/providers.dart';

class ActorInfoSkeleton extends StatelessWidget {
  final ActorsProvider ctrl;

  const ActorInfoSkeleton({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Get.theme.colorScheme.surfaceContainer,
              highlightColor: Get.theme.colorScheme.surfaceContainerHighest,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.theme.colorScheme.surfaceContainerLowest),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Get.theme.colorScheme.surfaceContainer,
                    highlightColor:
                        Get.theme.colorScheme.surfaceContainerHighest,
                    child: Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.theme.colorScheme.surfaceContainerLowest),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Shimmer.fromColors(
                    baseColor: Get.theme.colorScheme.surfaceContainer,
                    highlightColor:
                        Get.theme.colorScheme.surfaceContainerHighest,
                    child: Container(
                      width: 200,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.theme.colorScheme.surfaceContainerLowest),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
