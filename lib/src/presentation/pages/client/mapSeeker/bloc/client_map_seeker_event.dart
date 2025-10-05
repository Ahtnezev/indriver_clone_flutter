
abstract class ClientMapSeekerEvent {}

class CLientMapSeekerInitEvent extends ClientMapSeekerEvent {}
class FindPosition extends ClientMapSeekerEvent {}
class ChangeMapCameraPosition extends ClientMapSeekerEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}
