
import 'package:indriver_clone_flutter/src/domain/repository/geolocator_repository.dart';

class FindPositionUseCase {
  GeolocatorRepository geolocatorRepository;

  FindPositionUseCase(this.geolocatorRepository);

  run() => geolocatorRepository.findPosition();
}