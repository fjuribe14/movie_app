import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:new_app/config/config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_app/presentation/screens/screens.dart';

void main() async {
  /** Ensure that plugin services are initialized */
  WidgetsFlutterBinding.ensureInitialized();

  /** Set preferred orientations */
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /** Load .env file */
  await dotenv.load(fileName: kDebugMode ? '.env' : '.env.prod');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Baloo 2", "Baloo Da 2");

    MaterialTheme theme = MaterialTheme(textTheme);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        darkTheme: theme.dark(),
        getPages: AppRouter.list,
        title: Environment.appName,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        initialRoute: LatestMoviesScreen.screenName,
        theme: Get.isDarkMode ? theme.dark() : theme.light(),
        transitionDuration: const Duration(milliseconds: 700),
        themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (BuildContext context) => const NotFoundScreen()),
        // locale: Localization.locale,
        // translations: Localization(),
        // debugShowCheckedModeBanner: kDebugMode,
        // fallbackLocale: Localization.fallbackLocale,
      ),
    );
  }
}
