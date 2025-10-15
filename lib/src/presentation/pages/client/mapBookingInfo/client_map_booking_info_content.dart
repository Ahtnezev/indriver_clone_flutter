import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/client_map_booking_info_state.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_icon_back.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_text_field.dart';

class ClientMapBookingInfoContent extends StatelessWidget {
  ClientMapBookingInfoState state;

  ClientMapBookingInfoContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _googleMaps(context),
        Align(
          alignment: Alignment.bottomCenter,
          child: _cardBookingInfo(context)
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 20),
          child: DefaultIconBack()
        )
      ],
    );
  }

  Widget _cardBookingInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("Recoger en:", style: TextStyle(fontSize: 15),),
            subtitle: Text("Calle 123, Avenida, 123", style:  TextStyle(fontSize: 13),),
            leading: Icon(Icons.location_on),
          ),
          ListTile(
            title: Text("Dejar en:", style: TextStyle(fontSize: 15),),
            subtitle: Text("Calle 123, Avenida, 123", style:  TextStyle(fontSize: 13),),
            leading: Icon(Icons.my_location),
          ),
          ListTile(
            title: Text("Tiempo y distancia aproximado:", style: TextStyle(fontSize: 15),),
            subtitle: Text("0 Km y 0 Min", style:  TextStyle(fontSize: 13),),
            leading: Icon(Icons.timer),
          ),
          ListTile(
            title: Text("Precios recomendados:", style: TextStyle(fontSize: 15),),
            subtitle: Text("0\$", style:  TextStyle(fontSize: 13),),
            leading: Icon(Icons.attach_money),
          ),
          DefaultTextField(
            margin: EdgeInsets.only(left: 10, right: 10 ),
            text: "Ofrece tu tarifa",
            icon: Icons.attach_money,
            onChanged: (text) {

            }
          ),
          _actionProfile(
            'Buscar conductor',
            Icons.search,
            (){}
          )
        ],
      ),
    );
  }

  Widget _actionProfile(String option, IconData icon, Function() function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 0, top: 15),
        child: ListTile(
          title: Text(option, style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 106),
                  Color.fromARGB(255, 30, 112, 227),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _googleMaps(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.52,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: state.cameraPosition,
        // markers: Set<Marker>.of(state.markers.values),
      
        onMapCreated: (GoogleMapController controller) {
          //? set a style dark, more: https://mapstyle.withgoogle.com/
          //! important: remove spaces from json: https://codebeautify.org/remove-extra-spaces
          controller.setMapStyle('[ { "elementType": "geometry", "stylers": [ { "color": "#1d2c4d" } ] }, { "elementType": "labels.text.fill", "stylers": [ { "color": "#8ec3b9" } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "color": "#1a3646" } ] }, { "featureType": "administrative.country", "elementType": "geometry.stroke", "stylers": [ { "color": "#4b6878" } ] }, { "featureType": "administrative.land_parcel", "elementType": "labels.text.fill", "stylers": [ { "color": "#64779e" } ] }, { "featureType": "administrative.province", "elementType": "geometry.stroke", "stylers": [ { "color": "#4b6878" } ] }, { "featureType": "landscape.man_made", "elementType": "geometry.stroke", "stylers": [ { "color": "#334e87" } ] }, { "featureType": "landscape.natural", "elementType": "geometry", "stylers": [ { "color": "#023e58" } ] }, { "featureType": "poi", "elementType": "geometry", "stylers": [ { "color": "#283d6a" } ] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [ { "color": "#6f9ba5" } ] }, { "featureType": "poi", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1d2c4d" } ] }, { "featureType": "poi.park", "elementType": "geometry.fill", "stylers": [ { "color": "#023e58" } ] }, { "featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [ { "color": "#3C7680" } ] }, { "featureType": "road", "elementType": "geometry", "stylers": [ { "color": "#304a7d" } ] }, { "featureType": "road", "elementType": "labels.text.fill", "stylers": [ { "color": "#98a5be" } ] }, { "featureType": "road", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1d2c4d" } ] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [ { "color": "#2c6675" } ] }, { "featureType": "road.highway", "elementType": "geometry.stroke", "stylers": [ { "color": "#255763" } ] }, { "featureType": "road.highway", "elementType": "labels.text.fill", "stylers": [ { "color": "#b0d5ce" } ] }, { "featureType": "road.highway", "elementType": "labels.text.stroke", "stylers": [ { "color": "#023e58" } ] }, { "featureType": "transit", "elementType": "labels.text.fill", "stylers": [ { "color": "#98a5be" } ] }, { "featureType": "transit", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1d2c4d" } ] }, { "featureType": "transit.line", "elementType": "geometry.fill", "stylers": [ { "color": "#283d6a" } ] }, { "featureType": "transit.station", "elementType": "geometry", "stylers": [ { "color": "#3a4762" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#0e1626" } ] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [ { "color": "#4e6d70" } ] } ]');
          if(!state.controller!.isCompleted) {
            state.controller?.complete(controller);
          }
        },
      ),
    );
  }
  
}