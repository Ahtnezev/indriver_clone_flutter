import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/domain/models/placemark_data.dart';
import 'package:indriver_clone_flutter/src/domain/repository/geolocator_repository.dart';

class GeolocatorRepositoryImpl implements GeolocatorRepository {
  @override
    Future<Position> findPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint("La ubicacion no esta activada");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint("Permiso no ortorgado por el usuario");
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      debugPrint("Permiso no otorgado por el usuario permanente");
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<BitmapDescriptor> createMarkerFromAsset(String path) async {
    ImageConfiguration configuration = ImageConfiguration();
    // just in case change by: fromAssetImage -> asset
    BitmapDescriptor descriptor = await BitmapDescriptor.fromAssetImage(
      configuration,
      path,
    );
    return descriptor;
  }

  @override
  Marker getMarker(
    String markerId,
    double lat,
    double lng,
    String title,
    String content,
    BitmapDescriptor imageMarker,
  ) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
      markerId: id,
      icon: imageMarker,
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: title, snippet: content),
    );
    return marker;
  }

  @override
  Future<PlacemarkData?> getPlacemarkData(CameraPosition cameraPosition) async {
    double lat = cameraPosition.target.latitude;
    double lng = cameraPosition.target.longitude;
    List<Placemark> placemarkList = await placemarkFromCoordinates(lat, lng);
    if (placemarkList != null) {
      if (placemarkList.isNotEmpty) {
        String direction = placemarkList[0].thoroughfare!;
        String street = placemarkList[0].subThoroughfare!;
        String city = placemarkList[0].locality!;
        String department = placemarkList[0].administrativeArea!;

        PlacemarkData placemarkData = PlacemarkData(
          address: '$direction, $street, $city, $department',
          lat: lat,
          lng: lng
        );

        return placemarkData;
      }
    }
    return null;
  }



}