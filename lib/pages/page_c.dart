import 'package:clone_apps/widgets/you_tube_page/short_videos_grid_view.dart';
import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    // 今の画面サイズを調べる
    final screenSize = MediaQuery.of(context).size;
    return ColoredBox(
        color: Colors.black,
        child: ShortVideosGridView(screenSize: screenSize));
  }
}
