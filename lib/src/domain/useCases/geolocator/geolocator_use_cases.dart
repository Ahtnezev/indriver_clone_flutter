
//? plural
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/create_marker_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/find_position_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/get_marker_use_case.dart';

class GeolocatorUseCases {
  FindPositionUseCase findPosition;
  CreateMarkerUseCase createMarker;
  GetMarkerUseCase getMarker;

  GeolocatorUseCases({
    required this.findPosition,
    required this.createMarker,
    required this.getMarker,
  });
}