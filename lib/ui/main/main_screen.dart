import 'package:flutter/material.dart';
import 'package:seoulheatshelter/ui/detail/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('무더위 대피소 찾기'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    'https://cdn-icons-png.flaticon.com/128/5892/5892536.png'),
                SizedBox(
                  height: 16,
                ),
                Text('근처 무더위 대피소 찾기'),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen()),
                    );
                  },
                  child: Text('찾기'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
