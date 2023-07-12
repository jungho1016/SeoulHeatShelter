import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:latlong2/latlong.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';

import 'package:seoulheatshelter/domain/repositoy/shelter_repository.dart';

class ShelterRepositoryImpl implements ShelterRepository {
  @override
  Future<List<Shelter>> fetch(double latitude, double longitude) async {
    List<Shelter> shelters = [];
    const Distance distance = Distance();

    String jsonString = await rootBundle.loadString('assets/shelter.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonResult = jsonData['DATA'];
    jsonResult.forEach(
      (e) {
        final shelter = Shelter.fromJson(e);
        final meter = distance(
          LatLng(shelter.lat, shelter.lot),
          LatLng(latitude, longitude),
        );
        final newShelter = shelter.copyWith(m: meter);
        shelters.add(newShelter);
      },
    );

    shelters.sort((a, b) => a.m!.compareTo(b.m!));

    return shelters.take(5).toList();
  }

  Future<List<Shelter>> fetchRandom() async {
    String jsonString = await rootBundle.loadString('assets/shelter.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonResult = jsonData['DATA'];

    jsonResult.shuffle();

    return jsonResult.take(5).map((e) {
      return Shelter.fromJson(e);
    }).toList();
  }
}
