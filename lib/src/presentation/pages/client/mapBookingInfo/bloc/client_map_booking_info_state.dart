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
  final LatLng? pickUpLatLng;
  final LatLng? destionationLatLng;
  final String pickupDescription;
  final String destinationDescription;
  
  ClientMapBookingInfoState({
    this.position,
    this.controller,
    this.cameraPosition = const CameraPosition(target: LatLng(20.677260421532807, -103.34636321091749), zoom: 14.0, ),
    this.pickUpLatLng,
    this.destionationLatLng,
    this.pickupDescription = '',
    this.destinationDescription = '',
    this.markers = const <MarkerId, Marker>{},
  });

  ClientMapBookingInfoState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    CameraPosition? cameraPosition,
    PlacemarkData? placemarkData,
    LatLng? pickUpLatLng,
    LatLng? destionationLatLng,
    String? pickupDescription,
    String? destinationDescription,
    Map<MarkerId, Marker>? markers
  }) {
    return ClientMapBookingInfoState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      pickUpLatLng: pickUpLatLng ?? this.pickUpLatLng,
      destionationLatLng: destionationLatLng ?? this.destionationLatLng,
      pickupDescription: pickupDescription ?? this.pickupDescription,
      destinationDescription: destinationDescription ?? this.destinationDescription,
    );
  }

  @override
  List<Object?> get props => [position, markers, controller, cameraPosition, pickUpLatLng, destionationLatLng, pickupDescription, destinationDescription];

}