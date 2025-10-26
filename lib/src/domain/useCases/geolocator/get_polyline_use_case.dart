
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/domain/repository/geolocator_repository.dart';

class GetPolylineUseCase {
  GeolocatorRepository geolocatorRepository;
  GetPolylineUseCase(this.geolocatorRepository);

  run(LatLng pickupLatLng, LatLng destinationLatLng) => geolocatorRepository.getPolyline(pickupLatLng, destinationLatLng);
}