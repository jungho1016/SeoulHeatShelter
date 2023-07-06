import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';
import 'package:seoulheatshelter/ui/detail/detail_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  late Shelter shelter;

  DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<DetailViewModel>().fetch());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('무더위 대피소 목록'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: viewModel.shelters.length,
          itemBuilder: (BuildContext context, int index) {
            final shelter = viewModel.shelters[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => _launchUrl(shelter.la, shelter.lo),
                child: Card(
                  child: ListTile(
                    title: Text(shelter.r_area_nm),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shelter.r_detl_add),
                        Text('${shelter.km}km'),
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
                                Text(shelter.cler1_cnt.toString()),
                                Text(shelter.cler2_cnt.toString()),
                                Text(shelter.use_prnb.toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl(double lat, double lng) async {
    final Uri _url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (!await canLaunch(_url.toString())) {
      throw Exception('Could not launch $_url');
    }
    await launch(_url.toString());
  }
}
