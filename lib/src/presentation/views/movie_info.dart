import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../domain/use_cases/get_movie_cast.dart';
import '../../domain/use_cases/get_movie_info.dart';
import '../../domain/use_cases/get_movie_videos.dart';
import '../../domain/use_cases/get_recommended_movies.dart';
import '../../domain/use_cases/get_similar-movies.dart';
import '../../presentation/view_models/cast_vm.dart';
import '../../presentation/view_models/movie_vm.dart';
import '../../presentation/view_models/video_vm.dart';
import '../../presentation/widgets/obx_loader.dart';
import '../../config/colors.dart';
import '../../config/routes.dart';
import '../../presentation/widgets/custom_title.dart';
import '../../presentation/widgets/hr_films_list.dart';
import '../../presentation/widgets/section_heading.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({Key? key}) : super(key: key);
  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  final MovieViewModel _controller = Get.put(
    MovieViewModel(
      movieInfoUseCase: Get.find<GetMovieInfo>(),
      similarMoviesUseCase: Get.find<GetSimilarMovies>(),
      recommendedMoviesUseCase: Get.find<GetRecommendedMovies>(),
    ),
  );

  final CastViewModel _castController = Get.put(
    CastViewModel(
      movieCastUseCase: Get.find<GetMovieCast>(),
    ),
  );

  final VideoViewModel _videoController = Get.put(
    VideoViewModel(
      movieVideosUseCase: Get.find<GetMovieVideos>(),
    ),
  );

  final int currentMovieId = Get.arguments;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _controller.getMovieInfo(currentMovieId);
    _controller.getSimilarMovies(currentMovieId);
    _controller.getRecommendedMovies(currentMovieId);
    _castController.getMovieCast(currentMovieId);
    _videoController.getMovieVideos(currentMovieId);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NFColors.black,
      body: _controller.obx(
        (state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                        // ignore: deprecated_member_use
                        _controller.posterPath.value.isNull ||
                                _controller.posterPath.value.isEmpty
                            ? "https://us.123rf.com/450wm/bankrx/bankrx1805/bankrx180500212/101281804-grunge-red-unavailable-word-with-star-icon-round-rubber-stamp-on-white-background.jpg?ver=6"
                            : "https://image.tmdb.org/t/p/original${_controller.posterPath.value}",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.76,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, object, stacktrace) {
                      return Text(
                        "Unable to load this image!",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.red,
                            ),
                      );
                    }),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.16,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              NFColors.black.withOpacity(1),
                              NFColors.black.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SafeArea(
                      child: CustomTitle(
                        leftIcon: "assets/images/icons/arrow-left.svg",
                        title: "",
                        rightIcon: "assets/images/icons/info.svg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.title.toString(),
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: NFColors.gray10,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            child: _controller.adult.value == true
                                ? Text(
                                    "18+",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: NFColors.gray70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  )
                                : Text(
                                    "PG-13",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: NFColors.gray70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "${_controller.runtime.toString()} Mins",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.gray70,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            _controller.language.toUpperCase(),
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.gray70,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _controller.obx(
                        (state) {
                          return Wrap(
                            children: [
                              for (var genre in _controller.genres)
                                Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: Text(
                                    genre["name"].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: NFColors.gray70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                            ],
                          );
                        },
                        onLoading: const ObxLoader(),
                        onEmpty: const ObxLoader(),
                      ),
                      const SizedBox(height: 24),
                      for (var initialVid = 0; initialVid < 1; initialVid++)
                        ElevatedButton.icon(
                          onPressed: () => _trailersDialog(context,
                              _videoController.movieVideos[initialVid].key),
                          icon: Container(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NFColors.gray30,
                          ),
                          label: Text(
                            "Watch the Trailers",
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      const SizedBox(height: 22),
                      Text(
                        _controller.overview.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: NFColors.white,
                              height: 1.34,
                            ),
                      ),
                      const SizedBox(height: 16),
                      _castController.obx(
                        (state) {
                          return _castController.movieCast.isNotEmpty
                              ? Wrap(
                                  children: [
                                    Text(
                                      "Starring: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            color: NFColors.gray70,
                                          ),
                                    ),
                                    for (int members = 0;
                                        members < 8;
                                        members++)
                                      Text(
                                        "${_castController.movieCast[members].name.toString()}, ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: NFColors.white,
                                            ),
                                      ),
                                  ],
                                )
                              : Text(
                                  "Unable to get the cast for this movie",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: NFColors.red,
                                      ),
                                );
                        },
                        onLoading: const ObxLoader(),
                        onEmpty: const Text(
                          "Data not found",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => _castDialog(context),
                        icon: Container(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NFColors.gray30,
                        ),
                        label: Text(
                          "More about the Cast",
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const SectionHeading(
                  title: "TRAILERS & MORE",
                ),
                const SizedBox(height: 20),
                _videoController.obx(
                  (state) {
                    return SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 18),
                        itemCount: 10,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        itemBuilder: (context, index) {
                          final video = _videoController.movieVideos[index];
                          return GestureDetector(
                            onTap: () => _trailersDialog(context, video.key),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage((video.key.isEmpty
                                      ? "https://us.123rf.com/450wm/bankrx/bankrx1805/bankrx180500212/101281804-grunge-red-unavailable-word-with-star-icon-round-rubber-stamp-on-white-background.jpg?ver=6"
                                      : "https://i.ytimg.com/vi/${video.key}/hq720.jpg")),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: 320,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      NFColors.black.withOpacity(0.84),
                                      NFColors.black.withOpacity(0),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/icons/play-circle.svg",
                                      color: NFColors.white,
                                      width: 68,
                                      height: 68,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  },
                  onLoading: const ObxLoader(),
                  onEmpty: const ObxLoader(),
                ),
                const SizedBox(height: 42),
                HorizontalFilmsList(
                  sectionTitle: "MORE LIKE THIS",
                  itemCount: _controller.similarMovies.length,
                  itemBuilder: (context, index) {
                    final _movie = _controller.similarMovies[index];
                    return InkWell(
                      onTap: () => Get.offAndToNamed(
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
                ),
                const SizedBox(height: 18),
                HorizontalFilmsList(
                  sectionTitle: "RECOMMENDED MOVIES",
                  itemCount: _controller.recommendedMovies.length,
                  itemBuilder: (context, index) {
                    final _movie = _controller.recommendedMovies[index];
                    return InkWell(
                      onTap: () => Get.offAndToNamed(
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
                ),
              ],
            ),
          );
        },
        onLoading: const ObxLoader(),
        onEmpty: const ObxLoader(),
      ),
    );
  }

  _trailersDialog(context, videoId) {
    _youtubeController = YoutubePlayerController(
      initialVideoId: _videoController.movieVideos.isNotEmpty
          ? videoId
          : _videoController.movieVideos[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: _videoController.obx(
            (state) {
              return SafeArea(
                child: Stack(
                  children: [
                    YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: _youtubeController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.red,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.red,
                          handleColor: Colors.redAccent,
                        ),
                      ),
                      builder: (context, player) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            player,
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      for (var video
                                          in _videoController.movieVideos)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _youtubeController
                                                        .load(video.key);
                                                    _youtubeController.play();
                                                  },
                                                  child: Image.network(
                                                    YoutubePlayer.getThumbnail(
                                                        videoId: video.key
                                                            .toString(),
                                                        quality:
                                                            ThumbnailQuality
                                                                .high,
                                                        webp: false),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 14,
                                                    top: 14,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        video.name.toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2
                                                            ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        "Source: ${video.site.toString()}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Positioned(
                      left: 16,
                      top: 14,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            "assets/images/icons/arrow-left.svg",
                            color: NFColors.white,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            onLoading: const ObxLoader(),
            onEmpty: const ObxLoader(),
          ),
        );
      },
    );
  }

  _castDialog(context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: _videoController.obx(
            (state) {
              return SafeArea(
                child: Column(
                  children: [
                    const CustomTitle(
                      leftIcon: "assets/images/icons/arrow-left.svg",
                      title: "CAST",
                      rightIcon: "assets/images/icons/info.svg",
                      rightIconColor: Colors.transparent,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.76,
                      child: Center(
                        child: Text(
                          "Feature Coming Soon!",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
