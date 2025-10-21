import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/geolocator_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/client_map_booking_info_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/client_map_booking_info_state.dart';

class ClientMapBookingInfoBloc extends Bloc<ClientMapBookingInfoEvent , ClientMapBookingInfoState> {
  GeolocatorUseCases geolocatorUseCases;

  ClientMapBookingInfoBloc(this.geolocatorUseCases) : super(ClientMapBookingInfoState()) {
    on<CLientMapBookingInfoInitEvent>((event, emit) {
      final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
      emit(
        state.copyWith(
          pickUpLatLng: event.pickUpLatLng,
          destinationLatLng: event.destinationLatLng,
          pickupDescription: event.pickupDescription,
          destinationDescription: event.destinationDescription,
          controller: controller,
        )
      );
    });

    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      await googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(event.lat, event.lng),
            zoom: 13,
            bearing: 0,
          ),
        ),
      );
    });

    on<AddPolyline>((event, emit) async {
      List<LatLng> polylinesCoordinates = await geolocatorUseCases.getPolyline.run(state.pickUpLatLng!, state.destinationLatLng!);

      PolylineId id = PolylineId("MyRoute");
      Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blueAccent,
        points: polylinesCoordinates,
        width: 6
      );
      emit(
        state.copyWith(
          polylines: {
            id: polyline
          }
        )
      );
    });

  }
  
}