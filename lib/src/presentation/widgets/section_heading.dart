import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String? title;
  const SectionHeading({Key? key, this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        title ?? "Section Title",
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              letterSpacing: 0.4,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
