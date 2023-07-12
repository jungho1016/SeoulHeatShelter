import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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
      if (permission == LocationPermission.denied) {
        // 권한이 거부된 경우, 모달 창으로 알림을 표시합니다.
        return Future.error('위치 권한이 거부되었습니다.');
      }

      if (permission == LocationPermission.deniedForever) {
        // 권한이 영원히 거부된 경우, 권한 설정 페이지로 이동합니다.
        bool isOpened = await openAppSettings();
        if (!isOpened) {
          return Future.error('권한 설정 페이지를 열 수 없습니다.');
        }
        return Future.error('위치 권한이 영구적으로 거부되었습니다. 권한을 변경해주세요.');
      }

      // 여기까지 왔다면 권한이 허용되었고 디바이스의 위치에 접근할 수 있습니다.
      return await Geolocator.getCurrentPosition();
    } else {
      // whileInUse 권한이 없는 경우, 권한을 요청합니다.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부된 경우, 모달 창으로 알림을 표시합니다.

        return Future.error('위치 권한이 거부되었습니다.');
      } else if (permission == LocationPermission.deniedForever) {
        // 권한이 영원히 거부된 경우, 권한 설정 페이지로 이동합니다.
        bool isOpened = await openAppSettings();
        if (!isOpened) {
          return Future.error('권한 설정 페이지를 열 수 없습니다.');
        }
        return Future.error('위치 권한이 영구적으로 거부되었습니다. 권한을 변경해주세요.');
      }
    }

    return Future.error('위치 권한을 확인할 수 없습니다.');
  }

  @override
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
