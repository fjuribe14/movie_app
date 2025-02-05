import 'package:get/get.dart';
import 'package:new_app/presentation/screens/screens.dart';

class AppRouter {
  static final list = [
    GetPage(
      name: LatestMoviesScreen.screenName,
      page: () => const LatestMoviesScreen(),
    ),
    GetPage(
      name: MovieDetails.screenName,
      page: () => const MovieDetails(),
    ),
    GetPage(
      name: ActorDetails.screenName,
      page: () => const ActorDetails(),
    ),
  ];
}
