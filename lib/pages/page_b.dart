import 'package:clone_apps/widgets/you_tube_page/carousel_video_section.dart';
import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child:
          CarouselVideoSection(screenSize: screenSize, isSelectedTopNews: true),
    );
  }
}
