import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientMapBookingInfoPage extends StatefulWidget {
  const ClientMapBookingInfoPage({super.key});

  @override
  State<ClientMapBookingInfoPage> createState() => _ClientMapBookingInfoPageState();
}

class _ClientMapBookingInfoPageState extends State<ClientMapBookingInfoPage> {
  @override
  Widget build(BuildContext context) {
    //^ this comes from client_map_seeker_content file, in the arguments
    Map<String, dynamic> args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    LatLng pickUpLatLng = args['pickUpLatLng'];
    LatLng destinationUpLatLng = args['destionationLatLng'];
    LatLng pickUpDescription = args['pickUpDescription'];
    LatLng destinationDescription = args['destinationDescription'];

    // when the user set the origen and destino and then press the button to redirect another screen prints those
    debugPrint('pickupLatLng: ${pickUpLatLng.toJson()}');
    debugPrint('destinationUpLatLng: ${destinationUpLatLng.toJson()}');
    debugPrint('pickUpDescription: $pickUpDescription');
    debugPrint('destinationDescription: $destinationDescription');

    return Scaffold(
      body: Center(
        child: Text("Client map booking page"),
      ),
    );
  }
}