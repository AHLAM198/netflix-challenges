import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../src/config/colors.dart';

class HomeHeading extends StatelessWidget {
  final String? image, title, tagline;
  const HomeHeading({
    Key? key,
    this.image,
    this.title,
    this.tagline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              image ??
                  "https://us.123rf.com/450wm/bankrx/bankrx1805/bankrx180500212/101281804-grunge-red-unavailable-word-with-star-icon-round-rubber-stamp-on-white-background.jpg?ver=6",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.84,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: -8,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.84,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      NFColors.black.withOpacity(0),
                      NFColors.black,
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              // search section
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    // image
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: NFColors.gray30.withOpacity(0.7),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 7, 20, 8),
                        child: TextFormField(
                          strutStyle: StrutStyle.disabled,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            icon: SvgPicture.asset(
                              "assets/images/icons/search.svg",
                              color: NFColors.gray70,
                              width: 18,
                              height: 18,
                            ),
                            prefixIconColor: NFColors.white,
                            hintText: "Search for movies, shows...",
                            hintStyle:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.gray70,
                                      fontWeight: FontWeight.w400,
                                    ),
                            labelStyle:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: NFColors.white,
                                    ),
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.search,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: NFColors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title ?? "title unavailable",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: NFColors.white,
                            letterSpacing: 1.2,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      tagline ?? "tagline unavailable",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: NFColors.gray70,
                          ),
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/plus.svg",
                                width: 28,
                                height: 28,
                                color: NFColors.white,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "My List",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: NFColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  "assets/images/icons/play.svg",
                                  width: 32,
                                  height: 32,
                                  color: NFColors.black,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                "Play Now",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/info.svg",
                                width: 28,
                                height: 29,
                                color: NFColors.white,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Details",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
