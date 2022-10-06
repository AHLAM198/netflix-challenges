import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netflix/src/config/colors.dart';
import '../../../src/config/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NFColors.black,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/welcome_bg.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
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
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    NFColors.black,
                    NFColors.black.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  right: 18,
                  top: 10,
                  left: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/netflix-logo.svg",
                      width: 36,
                      height: 36,
                    ),
                    Row(
                      children: [
                        Text(
                          "PRIVACY",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: NFColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(width: 26),
                        Text(
                          "SIGN IN",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: NFColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
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
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    'Unlimited\nmovies, TV\nshows & more',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: NFColors.white,
                          fontWeight: FontWeight.w600,
                          height: 1.24,
                        ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Watch anywhere. Cancel anytime.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(NFRoutes.home),
                    child: Text(
                      "GET STARTED",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
