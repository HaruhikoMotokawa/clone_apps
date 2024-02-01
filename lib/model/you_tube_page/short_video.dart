import 'dart:math';

/// 動画を表すクラス
class ShortVideo {
  /// サムネイルのurl
  final String thumbnailUrl;

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

  ShortVideo(
      {required this.thumbnailUrl,
      required this.channelIconUrl,
      required this.videoTitle,
      required this.channelName,
      required this.playCount,
      required this.postDate});
}

/// アセットのパス
const String aseets = "assets/images/";

/// jpeg
const String jpeg = '.jpg';

final random = Random();

List<ShortVideo> generateRandomShortVideos({required int count}) {
  return List<ShortVideo>.generate(count, (index) {
    final imgIndex = random.nextInt(4) + 1; // 1 ~ 9
    final animalIndex = random.nextInt(5) + 1; // 1 ~ 5
    final urlPrefix = '${aseets}tate$imgIndex$jpeg';
    final channelIconUrlPrefix = '${aseets}animal$animalIndex$jpeg';
    return ShortVideo(
      thumbnailUrl: urlPrefix,
      channelIconUrl: channelIconUrlPrefix,
      videoTitle: '【密着】どこまで本物に近づけられるか？Flutter学習1３日目の真実 $index',
      channelName: 'はるさんチャンネル$index',
      playCount: random.nextInt(100000),
      postDate: DateTime.now().subtract(Duration(days: random.nextInt(365))),
    );
  });
}
