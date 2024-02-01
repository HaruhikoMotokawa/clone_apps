import 'package:clone_apps/Pages/page_B.dart';
import 'package:clone_apps/Pages/page_c.dart';
import 'package:clone_apps/Pages/you_tube_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const scope = ProviderScope(child: MyApp());
  runApp(scope);
}

// タブのインデックスを監視
final indexProvider = StateProvider((ref) {
  return 0;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックス
    final index = ref.watch(indexProvider);
    // バーのアイテム
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'YouTube',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'アイテムB',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'アイテムC',
      ),
    ];
    //
    // 下のバー
    //
    final bar = BottomNavigationBar(
      items: items, // アイテムたち
      backgroundColor: Colors.black, // バーの色
      selectedItemColor: Colors.white, // 選ばれたアイテムの色
      unselectedItemColor: Colors.grey, // 選ばれていないアイテムの色
      currentIndex: index, // インデックス
      onTap: (index) {
        // タップされたとき インデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
    );
    //
    // 画面たち
    const pages = [
      YouTubePage(),
      PageB(),
      PageC(),
    ];
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: pages[index],
          bottomNavigationBar: bar,
        ),
      ),
    );
  }
}
