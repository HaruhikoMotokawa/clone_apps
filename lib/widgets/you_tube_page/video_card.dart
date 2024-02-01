import 'package:clone_apps/model/you_tube_page/video.dart';
import 'package:clone_apps/widgets/you_tube_page/select_button.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video, required this.screenSize});

  final Video video;
  // 今の画面サイズを調べる
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // サムネ画像
        SizedBox(
          height: screenSize.height * 0.3,
          width: screenSize.width,
          child: Image.asset(
            video.thumbnailUrl,
            fit: BoxFit.cover,
          ),
        ),
        // 動画の情報
        Container(
          margin: const EdgeInsets.all(10),
          child: _VideoDetailsSection(
            channelIconUrl: video.channelIconUrl,
            videoTitle: video.videoTitle,
            channelName: video.channelName,
            playCount: video.playCount,
            postDate: video.postDate,
            screenSize: screenSize,
          ),
        )
      ],
    );
  }
}

/// 動画の詳細区画
class _VideoDetailsSection extends StatelessWidget {
  const _VideoDetailsSection(
      {required this.channelIconUrl,
      required this.videoTitle,
      required this.channelName,
      required this.playCount,
      required this.postDate,
      required this.screenSize});

  /// チャンネルアイコンのURL
  final String channelIconUrl;

  /// 動画のタイトル
  final String videoTitle;

  /// チャンネル名
  final String channelName;

  /// 再生回数
  final int playCount;

  /// 作成日日時
  final DateTime postDate;

// 今の画面サイズを調べる
  final Size screenSize;
  String _getFormattedPlayCount() {
    if (playCount >= 10000) {
      return '${(playCount / 10000).floor()}万';
    } else {
      return playCount.toString();
    }
  }

  String _getFormattedPostDate() {
    final now = DateTime.now();
    final difference = now.difference(postDate);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}年';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}ヶ月';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}日';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}時間';
    } else {
      return '${difference.inMinutes}分';
    }
  }

  @override
  Widget build(BuildContext context) {
    // // 今の画面サイズを調べる
    // final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // チャンネルアイコン
        Container(
          margin: const EdgeInsets.only(right: 3),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(channelIconUrl),
          ),
        ),
        // 詳細情報
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$channelName・${_getFormattedPlayCount()} 回視聴・${_getFormattedPostDate()} 前',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        // 選択ボタン
        Container(
            margin: const EdgeInsets.only(left: 3),
            child: SelectButton(screenSize: screenSize)),
      ],
    );
  }
}