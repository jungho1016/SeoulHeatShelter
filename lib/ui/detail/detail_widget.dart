import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/sun.png',
            scale: 4.0,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            '데이터를 로딩 중에 있습니다.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
