import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentation/view_models/home_vm.dart';
import '../../../src/config/colors.dart';
import '../../../src/config/routes.dart';
import '../../../src/presentation/widgets/home_heading.dart';
import '../../../src/presentation/widgets/hr_films_list.dart';

class Home extends GetWidget<HomeViewModel> {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NFColors.black,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            controller.obx(
              (state) {
                return HomeHeading(
                  image: (controller.adult.value == false
                      ? (controller.posterPath.value == null ||
                              controller.posterPath.value.isEmpty)
                          ? "https://us.123rf.com/450wm/bankrx/bankrx1805/bankrx180500212/101281804-grunge-red-unavailable-word-with-star-icon-round-rubber-stamp-on-white-background.jpg?ver=6"
                          : "https://image.tmdb.org/t/p/w500${controller.posterPath.value}"
                      : "https://us.123rf.com/450wm/bankrx/bankrx1805/bankrx180500212/101281804-grunge-red-unavailable-word-with-star-icon-round-rubber-stamp-on-white-background.jpg?ver=6"),
                  title: controller.title.value.toUpperCase(),
                  tagline: (controller.tagline.value.isEmpty)
                      ? "Tagline Unavailable"
                      : controller.tagline.value,
                );
              },
              onLoading: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            controller.obx(
              (state) {
                return HorizontalFilmsList(
                  sectionTitle: "NETFLIX ORIGINAL MOVIES",
                  itemCount: controller.nowPlayingMovies.length,
                  itemBuilder: (context, index) {
                    final _movie = controller.nowPlayingMovies[index];
                    return InkWell(
                      onTap: () => Get.toNamed(
                        NFRoutes.movieInfo,
                        arguments: _movie.id,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${_movie.posterPath}",
                          fit: BoxFit.cover,
                          width: 130,
                          height: 200,
                        ),
                      ),
                    );
                  },
                );
              },
              onLoading: const SizedBox(
                height: 200,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            controller.obx(
              (state) {
                return HorizontalFilmsList(
                  sectionTitle: "NETFLIX ORIGINAL SHOWS",
                  itemCount: controller.showsAiringToday.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, NFRoutes.seriesInfo,
                          arguments: [
                            {"name": controller.showsAiringToday[index].name},
                            {
                              "image":
                                  "https://image.tmdb.org/t/p/w500${controller.showsAiringToday[index].posterPath}"
                            }
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${controller.showsAiringToday[index].posterPath}",
                          fit: BoxFit.cover,
                          width: 130,
                          height: 200,
                        ),
                      ),
                    );
                  },
                );
              },
              onLoading: const SizedBox(
                height: 200,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
