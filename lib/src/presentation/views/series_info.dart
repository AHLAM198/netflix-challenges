import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:netflix/src/config/colors.dart';
import 'package:netflix/src/presentation/widgets/custom_title.dart';

import '../../config/routes.dart';
import '../widgets/hr_films_list.dart';
import '../widgets/section_heading.dart';

class SeriesInfo extends StatefulWidget {
  const SeriesInfo({Key? key}) : super(key: key);
  @override
  State<SeriesInfo> createState() => _SeriesInfoState();
}

class _SeriesInfoState extends State<SeriesInfo> {
  // get args => Get.arguments;
  final info = Get.arguments;
  late String name;
  @override
  void initState() {
    name = info[0]['name'] as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NFColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitle(
                title: 'Series Info',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.76,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        info[1]['image'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.32,
              //   width: MediaQuery.of(context).size.width,
              //   child: Chewie(
              //     controller: _chewieController,
              //   ),
              // ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "2016",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: NFColors.gray70,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: NFColors.gray10,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          child: Text(
                            "TV-14",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.gray70,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "4 Seasons",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: NFColors.gray70,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => {},
                            icon: Container(),
                            style: ElevatedButton.styleFrom(
                                primary: NFColors.white),
                            label: Text(
                              "Watch Now",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => {},
                            icon: Container(),
                            style: ElevatedButton.styleFrom(
                                primary: NFColors.gray30),
                            label: Text(
                              "Download",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "When his bogus law degree is exposed, Jeff Winger goes back to college and forms a study group of outcasts.",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: NFColors.white,
                            height: 1.34,
                          ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Starring: ",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.gray70,
                                    ),
                          ),
                          TextSpan(
                            text:
                                "Millie Bobby Brown, Finn Wolfhard, Noah Schapp, Caleb McLaughlin",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Director: ",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.gray70,
                                    ),
                          ),
                          TextSpan(
                            text: "David Benioff",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/icons/plus.svg",
                              color: NFColors.white,
                              width: 26,
                              height: 26,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "My List",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: NFColors.white,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/icons/thumbs-up.svg",
                              color: NFColors.white,
                              width: 26,
                              height: 26,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Rate",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: NFColors.white,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/icons/share.svg",
                              color: NFColors.white,
                              width: 26,
                              height: 26,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Share",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: NFColors.white,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () => {},
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: SvgPicture.asset(
                          "assets/images/icons/download.svg",
                          color: NFColors.white,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: NFColors.gray30),
                      label: Text(
                        "Download Season 1",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 42),
              const SectionHeading(
                title: "EPISODES",
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        height: 58,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: NFColors.gray30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Season 1 Episodes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                top: 1,
                              ),
                              child: SvgPicture.asset(
                                "assets/images/icons/down-chevron.svg",
                                color: NFColors.white,
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 246,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 18),
                  itemCount: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://dnm.nflximg.net/api/v6/BvVbc2Wxr2w6QuoANoSpJKEIWjQ/AAAAQdCwNYgUBxbXNEaNbk8bIbvyyvxsZtiB1AckdIH-daGK2yoYTyzalijVyR5Ka4-KjRzVX2F6wtYzKkDcTTBNjyBdvdpiGYDdyow3l7fI_Ff94-pzysdIypwmTv4dPpDTc8abKUnM7vqWn_QbQpZw6rCGqqA.jpg?r=de3"),
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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                "assets/images/icons/play-circle.svg",
                                color: NFColors.white,
                                width: 68,
                                height: 68,
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              child: Text(
                                "S1:E1 - THE BEGINNING",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      letterSpacing: 0.4,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 42),
              const SectionHeading(
                title: "TRAILERS & MORE",
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 18),
                  itemCount: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://fangirlish.com/wp-content/uploads/2020/12/Screen-Shot-2020-12-27-at-3.13.51-AM.png"),
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
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 42),
              HorizontalFilmsList(
                sectionTitle: "MORE LIKE THIS",
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(
                      NFRoutes.seriesInfo,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        "https://tv-fanatic-res.cloudinary.com/iu/s--7APz-7dk--/f_auto,q_auto/v1625109690/fear-street-part-one-1994-poster",
                        fit: BoxFit.cover,
                        width: 130,
                        height: 200,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              Center(
                child: Text(
                  "v2.5.1",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
