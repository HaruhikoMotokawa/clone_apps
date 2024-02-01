import 'package:clone_apps/model/you_tube_page/video.dart';
import 'package:clone_apps/widgets/you_tube_page/carousel_button_section.dart';
import 'package:clone_apps/widgets/you_tube_page/carousel_video_section.dart';
import 'package:clone_apps/widgets/you_tube_page/header_section.dart';
import 'package:clone_apps/widgets/you_tube_page/short_videos_grid_view.dart';
import 'package:clone_apps/widgets/you_tube_page/video_card.dart';
import 'package:flutter/material.dart';

class YouTubePage extends StatelessWidget {
  const YouTubePage({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = generateRandomVideos(count: 50);
    // 今の画面サイズを調べる
    final screenSize = MediaQuery.of(context).size;
    return ColoredBox(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: screenSize.height * 0.12,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Column(children: [HeaderSection(), CarouselButtonSection()]),
            ),
          ),
          // const SliverToBoxAdapter(child: HeaderSection()),
          // SliverToBoxAdapter(child: CarouselButtonSection()),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              switch (index) {
                case 0:
                  return VideoCard(
                      video: videos[index], screenSize: screenSize);
                case 1:
                  return ShortVideosGridView(screenSize: screenSize);
                case 7:
                  return CarouselVideoSection(
                      screenSize: screenSize, isSelectedTopNews: true);
                case 12:
                  return ShortVideosGridView(screenSize: screenSize);
                case 17:
                  return CarouselVideoSection(
                      screenSize: screenSize, isSelectedTopNews: false);
                default:
                  return VideoCard(
                      video: videos[index - 2], screenSize: screenSize);
              }
            },
            childCount: videos.length + 2,
          )),
        ],
      ),
    );
  }
}
