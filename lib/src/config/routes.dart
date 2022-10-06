import 'package:get/get.dart';
import 'package:netflix/src/presentation/bindings/bindings.dart';
import 'package:netflix/src/presentation/views/home.dart';
import 'package:netflix/src/presentation/views/movie_info.dart';
import 'package:netflix/src/presentation/views/series_info.dart';
import 'package:netflix/src/presentation/views/welcome.dart';

class NFRoutes {
  NFRoutes._();
  static const String welcome = "/";
  static const String home = "/home";
  static const String seriesInfo = "/seriesInfo";
  static const String movieInfo = "/movieInfo";
}

class NetflixPages {
  NetflixPages._();

  static final pages = [
    GetPage(
      name: NFRoutes.welcome,
      page: () => const Welcome(),
    ),
    GetPage(
      name: NFRoutes.home,
      page: () => const Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: NFRoutes.movieInfo,
      page: () => const MovieInfo(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: NFRoutes.seriesInfo,
      page: () => const SeriesInfo(),
    ),
  ];
}
