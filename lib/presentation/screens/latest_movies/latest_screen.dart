import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/presentation/widgets/widgets.dart';
import 'package:new_app/presentation/providers/providers.dart';
import 'package:new_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:new_app/infrastructure/datasources/moviedb_movies_datasource.dart';

class LatestMoviesScreen extends StatelessWidget {
  static const screenName = '/most_popular';

  const LatestMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    final movieRepositoryImpl =
        MovieRepositoryImpl(moviesDatasource: MoviedbMoviesDatasource());

    return GetBuilder<MoviesProvider>(
      autoRemove: false,
      init: MoviesProvider(moviesRepository: movieRepositoryImpl),
      builder: (ctrl) {
        return Scaffold(
          drawer: CustomDrawer(),
          body: RefreshIndicator(
            onRefresh: () async => await ctrl.loadPage(),
            child: CustomScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                CustomAppbar(),
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
