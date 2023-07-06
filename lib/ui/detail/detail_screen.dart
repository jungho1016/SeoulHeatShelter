import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('무더위 대피소 목록'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  child: ListTile(
                    title: Text('무더위센터명'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('주소'),
                        Text('거리km'),
                      ],
                    ),
                    trailing: Container(
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/128/6227/6227088.png',
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/128/1530/1530297.png',
                                  ),
                                ),
                                Text('이용 가능 인원'),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.add_alert),
                                Text('이용 인원'),
                                Text('이용 인원'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
