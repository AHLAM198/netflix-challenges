import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netflix/src/config/colors.dart';

class CustomTitle extends StatelessWidget {
  final String? title;
  final String? leftIcon;
  final String? rightIcon;
  final Color? rightIconColor;

  const CustomTitle({
    Key? key,
    this.title,
    this.leftIcon,
    this.rightIcon,
    this.rightIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              leftIcon ?? "assets/images/icons/arrow-left.svg",
              color: NFColors.white,
              width: 28,
              height: 28,
            ),
          ),
          const SizedBox(width: 38),
          Flexible(
            child: Text(
              title ?? "Page Title",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(width: 38),
          SvgPicture.asset(
            rightIcon ?? "assets/images/icons/info.svg",
            color: rightIconColor ?? NFColors.white,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
