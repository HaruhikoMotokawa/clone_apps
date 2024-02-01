import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    // アプリロゴ
    final appLogo = Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 10.0, // 四角形の幅
              height: 10.0, // 四角形の高さ
              color: Colors.white, // 四角形の色を白に設定
            ),
            const Icon(
              Icons.smart_display,
              color: Colors.red,
              size: 30.0, // アイコンのサイズを30に設定
            ),
          ],
        ),
        const Text(
          'YouTube',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
    // 右側のアイコン
    final rightIcons = Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast_connected, color: Colors.white)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white)),
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appLogo,
        rightIcons,
      ],
    );
  }
}