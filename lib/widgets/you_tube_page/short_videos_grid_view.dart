import 'package:clone_apps/model/you_tube_page/short_video.dart';
import 'package:clone_apps/widgets/you_tube_page/select_button.dart';
import 'package:flutter/material.dart';

class ShortVideosGridView extends StatelessWidget {
  const ShortVideosGridView({super.key, required this.screenSize});

  /// 今の画面サイズを調べる
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    // 表示するショート動画
    final shortVideos = generateRandomShortVideos(count: 4);
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          const _TextSection(),
          SizedBox(
            height: screenSize.height * 0.73,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shortVideos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2, // 2列のグリッドを作成
                  childAspectRatio: screenSize.aspectRatio * 1.4),
              itemBuilder: (context, index) {
                return _ShortVideoCard(shortVideos[index], screenSize);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const Icon(
              Icons.video_library,
              color: Colors.red,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const Text(
              'ショート',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

/// ショート用動画カード
class _ShortVideoCard extends StatelessWidget {
  const _ShortVideoCard(this.shortVideo, this.screenSize);

  /// サムネイルのurl
  final ShortVideo shortVideo;

  /// 今の画面サイズを調べる
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              shortVideo.thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: SelectButton(screenSize: screenSize)),
              ],
            ),
            const Spacer(),
            Text(
              shortVideo.videoTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}
