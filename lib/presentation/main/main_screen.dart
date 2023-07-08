import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seoulheatshelter/presentation/detail/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  // Future<void> _requestPermission(BuildContext context) async {
  //   final permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     final showDialogResult = await showDialog<bool>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('위치 권한 요청'),
  //           content: const Text('앱에서 위치 정보를 사용하려면 위치 권한이 필요합니다.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(true),
  //               child: const Text('허용'),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(false),
  //               child: const Text('거부'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //     if (showDialogResult == true) {
  //       await Geolocator.requestPermission();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '무더위 대피소 찾기',
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/sun1.png'),
                const SizedBox(height: 16),
                const Text(
                  '근처 무더위 대피소 찾기',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[50]!),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    '찾기',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
