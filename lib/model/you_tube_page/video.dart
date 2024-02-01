import 'dart:math';

/// 動画を表すクラス
class Video {
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

  Video(
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
final videos = [
  Video(
      thumbnailUrl: '${aseets}img1$jpeg',
      channelIconUrl: '${aseets}img2$jpeg',
      videoTitle: '【最新情報】果たしてどこまで本物に近づけさせるのか、Flutter学習10日目の真実',
      channelName: 'ワンワンチャンネル切り抜き公式',
      playCount: 99999,
      postDate: DateTime.parse('2024-01-30T05:06:07.008+09:00'))
];

final random = Random();

List<Video> generateRandomVideos({required int count}) {
  return List<Video>.generate(count, (index) {
    final imgIndex = random.nextInt(9) + 1; // 1 ~ 9
    final animalIndex = random.nextInt(5) + 1; // 1 ~ 5
    final urlPrefix = '${aseets}img$imgIndex$jpeg';
    final channelIconUrlPrefix = '${aseets}animal$animalIndex$jpeg';
    return Video(
      thumbnailUrl: urlPrefix,
      channelIconUrl: channelIconUrlPrefix,
      videoTitle: '【最新情報】どこまで本物に近づけられるか？Flutter学習10日目の真実 $index',
      channelName: 'はるさんチャンネル$index',
      playCount: random.nextInt(100000),
      postDate: DateTime.now().subtract(Duration(days: random.nextInt(365))),
    );
  });
}
