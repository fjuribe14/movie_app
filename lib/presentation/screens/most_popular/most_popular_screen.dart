import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:new_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_app/infrastructure/repositories/movie_repository_impl.dart';

class MostPopularScreen extends StatelessWidget {
  static const screenName = '/most-popular';

  const MostPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    final movieRepositoryImpl =
        MovieRepositoryImpl(moviesDatasource: MoviedbDatasource());

    return GetBuilder<MoviesProvider>(
      init: MoviesProvider(moviesRepository: movieRepositoryImpl),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Latest'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async => await ctrl.loadPage(),
              child: SingleChildScrollView(
                clipBehavior: Clip.hardEdge,
                controller: scrollController,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Obx(
                  () {
                    return MasonryGridView.extent(
                      shrinkWrap: true,
                      crossAxisSpacing: 26,
                      maxCrossAxisExtent: 200.0,
                      itemCount: ctrl.movies.length,
                      padding: const EdgeInsets.all(26),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Get.toNamed('/movie/${ctrl.movies[index].id}')
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
                                image:
                                    NetworkImage(ctrl.movies[index].posterPath),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  offset: const Offset(2, 2),
                                  color:
                                      Get.theme.colorScheme.shadow.withValues(
                                    alpha: 0.3,
                                  ),
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
                                    style: Get.textTheme.titleMedium?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                  Text(
                                    '${(ctrl.movies[index].voteAverage * 10).toInt()}% User Score',
                                    style: Get.textTheme.bodySmall?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
