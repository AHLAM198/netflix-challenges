import 'package:flutter/material.dart';
import 'package:netflix/src/presentation/widgets/section_heading.dart';
import '../../../src/config/routes.dart';

class HorizontalFilmsList extends StatelessWidget {
  final String? sectionTitle;
  final Widget Function(BuildContext, int) itemBuilder;
  final int? itemCount;

  const HorizontalFilmsList({
    Key? key,
    this.sectionTitle,
    required this.itemBuilder,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: sectionTitle ?? "Section Title",),
            const SizedBox(height: 18),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: itemCount ?? 0,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemBuilder: itemBuilder,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
