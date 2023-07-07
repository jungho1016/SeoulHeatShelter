import 'package:seoulheatshelter/domain/model/shelter.dart';

abstract interface class ShelterRepository {
  Future<List<Shelter>> fetch(double latitude, double longitude);
}
