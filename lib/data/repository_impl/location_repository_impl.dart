import 'package:geolocator/geolocator.dart';
import 'package:seoulheatshelter/domain/repositoy/location_reposity.dart';

class LocationRepositoryImple implements LocationRepository {
  /// 디바이스의 현재 위치를 결정합니다.
  ///
  /// 위치 서비스가 비활성화되어 있거나 권한이 거부된 경우 `Future`에서 오류를 반환합니다.
  @override
  Future<Position> determinePosition() async {
    // 위치 서비스가 활성화되어 있는지 테스트합니다.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화되어 있으므로 위치에 액세스하지 않고
      // 사용자에게 위치 서비스를 활성화하도록 요청합니다.
      return Future.error('위치 서비스가 비활성화되었습니다.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse) {
      permission = await Geolocator.requestPermission();
      return await Geolocator.getCurrentPosition();
    }

    if (permission == LocationPermission.denied) {
      // 권한이 거부된 경우, 모달 창으로 알림을 표시합니다.
      return Future.error('위치 권한이 거부되었습니다. 임의의 5군데 무더위 대피소를 보여드립니다.');
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한이 영원히 거부된 경우, 권한 설정 페이지로 이동합니다.
      return Future.error('위치 권한이 영구적으로 거부되었습니다. 임의의 5군데 무더위 대피소를 보여드립니다.');
    }

    // 여기까지 왔다면 권한이 허용되었고 디바이스의 위치에 접근할 수 있습니다.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
