import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:latlong2/latlong.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';

class ShelterRepository {
  Future<List<Shelter>> fetch(double latitude, double longitude) async {
    List<Shelter> shelters = [];
    const Distance distance = Distance();

    String jsonString = await rootBundle.loadString('assets/shelter.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonResult = jsonData['DATA'];
    jsonResult.forEach(
      (e) {
        final shelter = Shelter.fromJson(e);
        final km = distance.as(
          LengthUnit.Kilometer,
          LatLng(shelter.lat, shelter.lot),
          LatLng(latitude, longitude),
        );
        final newShelter = shelter.copyWith(km: km);
        shelters.add(newShelter);
      },
    );

    shelters.sort((a, b) => a.km!.compareTo(b.km!));
    return shelters.take(5).toList();
  }
}
