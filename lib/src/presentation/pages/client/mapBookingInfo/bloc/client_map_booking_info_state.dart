import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/domain/models/placemark_data.dart';

class ClientMapBookingInfoState extends Equatable {

  final Completer<GoogleMapController>? controller;
  final Position? position;
  final CameraPosition cameraPosition;
  final Map<MarkerId, Marker> markers;
  final Map<PolylineId, Polyline> polylines;
  final LatLng? pickUpLatLng;
  final LatLng? destinationLatLng;
  final String pickupDescription;
  final String destinationDescription;
  
  ClientMapBookingInfoState({
    this.position,
    this.controller,
    this.cameraPosition = const CameraPosition(target: LatLng(20.677260421532807, -103.34636321091749), zoom: 14.0, ),
    this.pickUpLatLng,
    this.destinationLatLng,
    this.pickupDescription = '',
    this.destinationDescription = '',
    this.markers = const <MarkerId, Marker>{},
    this.polylines = const <PolylineId, Polyline>{},
  });

  ClientMapBookingInfoState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    CameraPosition? cameraPosition,
    PlacemarkData? placemarkData,
    LatLng? pickUpLatLng,
    LatLng? destinationLatLng,
    String? pickupDescription,
    String? destinationDescription,
    Map<MarkerId, Marker>? markers,
    Map<PolylineId, Polyline>? polylines
  }) {
    return ClientMapBookingInfoState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      pickUpLatLng: pickUpLatLng ?? this.pickUpLatLng,
      destinationLatLng: destinationLatLng ?? this.destinationLatLng,
      pickupDescription: pickupDescription ?? this.pickupDescription,
      destinationDescription: destinationDescription ?? this.destinationDescription,
    );
  }

  @override
  List<Object?> get props => [position, markers, polylines, controller, cameraPosition, pickUpLatLng, destinationLatLng, pickupDescription, destinationDescription];

}