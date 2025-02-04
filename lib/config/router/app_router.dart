import 'package:get/get.dart';
import 'package:new_app/presentation/screens/screens.dart';

class AppRouter {
  static final list = [
    GetPage(
      name: MostPopularScreen.screenName,
      page: () => const MostPopularScreen(),
    ),
  ];
}
