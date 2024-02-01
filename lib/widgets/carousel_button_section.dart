import 'package:flutter/material.dart';

class CarouselButtonSection extends StatelessWidget {
  CarouselButtonSection({super.key});

  /// ボタンのタイトル
  final List<String> genres = [
    'ゲーム',
    'ミックス',
    '音楽ニュース',
    'ライブ',
    'アクション＆アドベンチャー',
    '料理',
    '最近アップロードされた動画',
    '投稿'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _CompassButton(),
          const _GenreButton(genre: 'すべて'),
          const _GenreButton(genre: '新しい動画の発見'),
          _GenreButtons(genres),
          const _TextButton(),
        ],
      ),
    );
  }
}

/// アンダースコアをつけるとファイルプライベートなクラスになる
/// つまり、他のファイルから参照できなくなる
/// なのでWidgetは基本クラスで定義していっても不要な乱立を防げる
class _CompassButton extends StatelessWidget {
  const _CompassButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.explore, color: Colors.white),
        padding: const EdgeInsets.all(3),
      ),
    );
  }
}

/// ジャンルボタン
class _GenreButton extends StatelessWidget {
  const _GenreButton({required this.genre});

  /// ボタンに表示するテキスト
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 26, 20, 20)),
            onPressed: () {},
            child: Text(
              genre,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )));
  }
}

/// ジャンルボタンを受け取ったリストの数だけ生成して横に並べる
class _GenreButtons extends StatelessWidget {
  const _GenreButtons(this.genres);

  /// ジャンルのリスト
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: genres.map((genre) {
      return _GenreButton(genre: genre);
    }).toList());
  }
}

/// テキストだけのボタン
class _TextButton extends StatelessWidget {
  const _TextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Text('フィードバックを送信',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)));
  }
}
