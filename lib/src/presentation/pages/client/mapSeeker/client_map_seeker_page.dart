import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_state.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/google_places_auto_complete.dart';

//! google maps keys missin in files android/ios

class ClientMapSeekerPage extends StatefulWidget {
  const ClientMapSeekerPage({super.key});

  @override
  State<ClientMapSeekerPage> createState() => _ClientMapSeekerPageState();
}

class _ClientMapSeekerPageState extends State<ClientMapSeekerPage> {

  TextEditingController pickUpController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //^ wait until the blocbuilder finish load all elements
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ClientMapSeekerBloc>().add(CLientMapSeekerInitEvent());
      context.read<ClientMapSeekerBloc>().add(FindPosition());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClientMapSeekerBloc, ClientMapSeekerState>(
        builder: (context, state) {
          return Stack(
            children: [
              
              Container(
                height: 110,
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: _googlePlacesAutocomplete()
              ),
              _iconMyLocation()
            ]
          );
        },
      ),
    );
  }

  Widget _googlePlacesAutocomplete() {
    return Card(
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          GooglePlacesAutoComplete(pickUpController, "Recoger en", (prediction) {
            if (prediction != null) {
              context.read<ClientMapSeekerBloc>().add(
                ChangeMapCameraPosition(
                  lat: double.parse(prediction.lat!),
                  lng: double.parse(prediction.lng!)
                )
              );
              context.read<ClientMapSeekerBloc>().add(
                OnAutocompletePickUpSelected(
                  lat: double.parse(prediction.lat!),
                  lng: double.parse(prediction.lng!),
                  pickupDescription: prediction.description ?? ''
                )
              );
            }

            debugPrint("Recoger en Lat: ${prediction.lat}");
            debugPrint("Recoger en Lng: ${prediction.lng}");
          }),
          GooglePlacesAutoComplete(destinationController, "Dejar en", (prediction) {

            context.read<ClientMapSeekerBloc>().add(
              OnAutocompleteDestionationSelected(
                lat: double.parse(prediction.lat!),
                lng: double.parse(prediction.lng!),
                destinationDescription: prediction.description ?? ''
              )
            );

            debugPrint("Dejar en Lat: ${prediction.lat}");
            debugPrint("Dejar en Lng: ${prediction.lng}");
          }),
        ],
      ),
    );
  }


  Widget _googleMaps() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: state.cameraPosition,
      markers: Set<Marker>.of(state.markers.values),
      onCameraMove: (CameraPosition cameraPosition) {
        context.read<ClientMapSeekerBloc>().add(OnCameraMove(cameraPosition: cameraPosition));
      },
      onCameraIdle: ()async {
        context.read<ClientMapSeekerBloc>().add(OnCameraIdle());
        pickUpController.text = state.placemarkData?.address ?? '';
      },
      onMapCreated: (GoogleMapController controller) {
        //? set a style dark, more: https://mapstyle.withgoogle.com/
        //! important: remove spaces from json: https://codebeautify.org/remove-extra-spaces
        controller.setMapStyle('[ { "elementType": "geometry", "stylers": [ { "color": "#1d2c4d" } ] }, { "elementType": "labels.text.fill", "stylers": [ { "color": "#8ec3b9" } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "color": "#1a3646" } ] }, { "featureType": "administrative.country", "elementType": "geometry.stroke", "stylers": [ { "color": "#4b6878" } ] }, { "featureType": "administrative.land_parcel", "elementType": "labels.text.fill", "stylers": [ { "color": "#64779e" } ] }, { "featureType": "administrative.province", "elementType": "geometry.stroke", "stylers": [ { "color": "#4b6878" } ] }, { "featureType": "landscape.man_made", "elementType": "geometry.stroke", "stylers": [ { "color": "#334e87" } ] }, { "featureType": "landscape.natural", "elementType": "geometry", "stylers": [ { "color": "#023e58" } ] }, { "featureType": "poi", "elementType": "geometry", "stylers": [ { "color": "#283d6a" } ] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [ { "color": "#6f9ba5" } ] }, { "featureType": "poi", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1d2c4d" } ] }, { "featureType": "poi.park", "elementType": "geometry.fill", "stylers": [ { "color": "#023e58" } ] }, { "featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [ { "color": "#3C7680" } ] }, { "featureType": "road", "elementType": "geometry", "stylers": [ { "color": "#304a7d" } ] }, { "featureType": "road", "elementType": "labels.text.fill", "stylers": [ { "color": "#98a5be" } ] }, { "featureType": "road", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1d2c4d" } ] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [ { "color": "#2c6675" } ] }, { "featureType": "road.highway", "elementType": "geometry.stroke", "stylers": [ { "color": "#255763" } ] }, { "featureType": "road.highway", "elementType": "labels.text.fill", "stylers": [ { "color": "#b0d5ce" } ] }, { "featureType": "road.highway", "elementType": "labels.text.stroke", "stylers": [ { "color": "#023e58" } ] }, { "featureType": "transit", "elementType": "labels.text.fill", "stylers": [ { "color": "#98a5be" } ] }, { "featureType": "transit", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1d2c4d" } ] }, { "featureType": "transit.line", "elementType": "geometry.fill", "stylers": [ { "color": "#283d6a" } ] }, { "featureType": "transit.station", "elementType": "geometry", "stylers": [ { "color": "#3a4762" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#0e1626" } ] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [ { "color": "#4e6d70" } ] } ]');
        if(!state.controller!.isCompleted) {
          state.controller?.complete(controller);
        }
      },
    );
  }

  Widget _iconMyLocation() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/location_blue.png',
        width: 55,
        height: 55
      ),
    );
  }

}
