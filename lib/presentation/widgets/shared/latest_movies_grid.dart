import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/widgets/widgets.dart';
import 'package:new_app/presentation/providers/providers.dart';

class LatestMoviesGrid extends StatelessWidget {
  const LatestMoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MoviesProvider>();

    return Obx(
      () => ctrl.isLoading.value
          ? LatestMoviesGridSkeleton()
          : LatestMoviesGridData(),
    );
  }
}
