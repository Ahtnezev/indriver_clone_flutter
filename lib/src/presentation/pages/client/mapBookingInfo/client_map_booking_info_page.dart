import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/client_map_booking_info_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/client_map_booking_info_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/client_map_booking_info_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapBookingInfo/client_map_booking_info_content.dart';

class ClientMapBookingInfoPage extends StatefulWidget {
  const ClientMapBookingInfoPage({super.key});

  @override
  State<ClientMapBookingInfoPage> createState() =>
      _ClientMapBookingInfoPageState();
}

class _ClientMapBookingInfoPageState extends State<ClientMapBookingInfoPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      context.read<ClientMapBookingInfoBloc>().add(CLientMapBookingInfoInitEvent(
        // pickUpLatLng: 
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    //^ this comes from client_map_seeker_content file, in the arguments
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    LatLng pickUpLatLng = args['pickUpLatLng'];
    LatLng destinationUpLatLng = args['destinationLatLng'];
    LatLng pickUpDescription = args['pickUpDescription'];
    LatLng destinationDescription = args['destinationDescription'];

    // when the user set the origen and destino and then press the button to redirect another screen prints those
    debugPrint('pickupLatLng: ${pickUpLatLng.toJson()}');
    debugPrint('destinationUpLatLng: ${destinationUpLatLng.toJson()}');
    debugPrint('pickUpDescription: $pickUpDescription');
    debugPrint('destinationDescription: $destinationDescription');

    return Scaffold(
      body: BlocBuilder<ClientMapBookingInfoBloc, ClientMapBookingInfoState>(
        builder: (context, state) {
          return ClientMapBookingInfoContent(state);
        },
      ),
    );

  }
}
