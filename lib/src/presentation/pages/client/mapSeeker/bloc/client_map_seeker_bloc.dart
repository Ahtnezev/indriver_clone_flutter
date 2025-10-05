
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/geolocator_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_state.dart';

class ClientMapSeekerBloc extends Bloc<ClientMapSeekerEvent, ClientMapSeekerState> {
  GeolocatorUseCases geolocatorUseCases;

  // probably we have a error with this google maps package, ensure to do: flutter clean command and review build.gradle in kotlin version, and console
  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();
      emit(state.copyWith(position: position));
      debugPrint("Position Lat: ${position.latitude}");
      debugPrint("Position Lon: ${position.longitude}");
    });
  }

}