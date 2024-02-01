import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({required this.screenSize, super.key});

  /// 配置されている親ウィジェットの横幅
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screenSize.width * 0.05,
        child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const _VideoOptionSheet());
                },
              );
            },
            child: const Text('●\n●\n●',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 5))));
  }
}

class _VideoOptionSheet extends StatelessWidget {
  const _VideoOptionSheet();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.map,
              color: Colors.white,
            ),
            label: const Text(
              'Map',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.photo_album,
              color: Colors.white,
            ),
            label: const Text(
              'Album',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
            label: const Text(
              'Phone',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
