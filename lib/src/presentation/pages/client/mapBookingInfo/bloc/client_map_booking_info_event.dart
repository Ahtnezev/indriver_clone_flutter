
 
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ClientMapBookingInfoEvent {}

class CLientMapBookingInfoInitEvent extends ClientMapBookingInfoEvent {
  final LatLng pickUpLatLng;
  final LatLng destinationLatLng;
  final String pickupDescription;
  final String destinationDescription;

  CLientMapBookingInfoInitEvent({
    required this.pickUpLatLng,
    required this.destinationLatLng,
    required this.pickupDescription,
    required this.destinationDescription,
  });
}

class ChangeMapCameraPosition extends ClientMapBookingInfoEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}

class AddPolyline extends ClientMapBookingInfoEvent {}