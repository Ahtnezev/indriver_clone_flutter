
 
abstract class ClientMapBookingInfoEvent {}

class CLientMapBookingInfoInitEvent extends ClientMapBookingInfoEvent {}

class ChangeMapCameraPosition extends ClientMapBookingInfoEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}