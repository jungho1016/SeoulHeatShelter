import 'package:geolocator/geolocator.dart';

import '../model/shelter.dart';

abstract interface class ShelterRepository {
  Future<List<Shelter>> fetch(double latitude, double longitude);
}

abstract interface class LocationRepository {
  Future<Position> determinePosition();
  Future<Position> getCurrenLocation();
}
