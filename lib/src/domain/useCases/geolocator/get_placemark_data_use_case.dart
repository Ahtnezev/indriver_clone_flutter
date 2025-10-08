
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/domain/repository/geolocator_repository.dart';

class GetPlacemarkDataUseCase {
  GeolocatorRepository geolocatorRepository;
  GetPlacemarkDataUseCase(this.geolocatorRepository);

  run(CameraPosition cameraPosition) => geolocatorRepository.getPlacemarkData(cameraPosition);
}