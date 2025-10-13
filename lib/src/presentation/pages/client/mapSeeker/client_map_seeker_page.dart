import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_content.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_state.dart';

//! google maps keys missin in files android/ios

class ClientMapSeekerPage extends StatefulWidget {
  const ClientMapSeekerPage({super.key});

  @override
  State<ClientMapSeekerPage> createState() => _ClientMapSeekerPageState();
}

class _ClientMapSeekerPageState extends State<ClientMapSeekerPage> {

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
          return ClientMapSeekerContent(state);
        },
      ),
    );
  }

}
