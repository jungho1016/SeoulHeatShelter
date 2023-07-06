import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';
import 'package:seoulheatshelter/ui/detail/detail_view_model.dart';
import 'package:seoulheatshelter/ui/detail/detail_widget.dart';
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
          title: const Text('무더위 대피소 목록'),
          centerTitle: true,
        ),
        body: viewModel.isLoading == true
            ? const Loading()
            : ListView.builder(
                itemCount: viewModel.shelters.length,
                itemBuilder: (BuildContext context, int index) {
                  final shelter = viewModel.shelters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () => _launchUrl(shelter.la, shelter.lo),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shelter.r_area_nm,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(shelter.r_detl_add),
                                    const SizedBox(height: 4),
                                    Text('${shelter.km}km'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'assets/fan.png',
                                          scale: 5.0,
                                        ),
                                        Image.asset(
                                          'assets/airconditioner.png',
                                          scale: 5.0,
                                        ),
                                        const Text(
                                          '이용 가능 인원',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          shelter.cler1_cnt.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          shelter.cler2_cnt.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          shelter.use_prnb.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
