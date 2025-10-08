
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ClientMapSeekerEvent {}

class CLientMapSeekerInitEvent extends ClientMapSeekerEvent {}
class FindPosition extends ClientMapSeekerEvent {}
class ChangeMapCameraPosition extends ClientMapSeekerEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}

class OnCameraMove extends ClientMapSeekerEvent {
  CameraPosition cameraPosition;
  OnCameraMove({required this.cameraPosition});
}

class OnCameraIdle extends ClientMapSeekerEvent {}

class OnAutocompletePickUpSelected extends ClientMapSeekerEvent {
  double lat;
  double lng;
  String pickupDescription;
  OnAutocompletePickUpSelected({required this.lat, required this.lng, required this.pickupDescription});
}

class OnAutocompleteDestionationSelected extends ClientMapSeekerEvent {
  double lat;
  double lng;
  String destinationDescription;
  OnAutocompleteDestionationSelected({required this.lat, required this.lng, required this.destinationDescription});
}
