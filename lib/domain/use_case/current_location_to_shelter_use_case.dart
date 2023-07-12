import 'package:geolocator/geolocator.dart';
import 'package:seoulheatshelter/core/result.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';
import 'package:seoulheatshelter/domain/repositoy/location_reposity.dart';
import 'package:seoulheatshelter/domain/repositoy/shelter_repository.dart';

class CurrentLocationTShelter {
  final LocationRepository _locationRepository;
  final ShelterRepository _shelterRepository;
  CurrentLocationTShelter(this._locationRepository, this._shelterRepository);

  Future<Result<List<Shelter>>> execute() async {
    try {
      Position position = await _locationRepository.determinePosition();

      List<Shelter> shelters = await _shelterRepository.fetch(
        position.latitude,
        position.longitude,
      );

      return Result.success(shelters);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
