import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/main.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/mapSeeker/client_map_seeker_page.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/driver/bloc/driver_home_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/driver/bloc/driver_home_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/driver/bloc/driver_home_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/profile_info_page.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/roles/roles_page.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  List<Widget> pageList = <Widget>[
    ClientMapSeekerPage(),
    ProfileInfoPage(),
    RolesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu de opciones")),
      drawer: BlocBuilder<DriverHomeBloc, DriverHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 12, 38, 145),
                        Color.fromARGB(255, 34, 156, 249),
                      ],
                    ),
                  ),
                  child: Text(
                    "Menu del conductor",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                
                ListTile(
                  title: Text("Mapa de viajes"),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<DriverHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0),
                    );
                    Navigator.pop(
                      context,
                    ); // redirect when user click in item of menu from drawer
                  },
                ),

                // to use pageIndex we need to access, needs envolve Drawer in a BlocBuilder...
                ListTile(
                  title: Text("Perfil del usuario"),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    context.read<DriverHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 1),
                    );
                    Navigator.pop(
                      context,
                    ); // redirect when user click in item of menu from drawer
                  },
                ),

                ListTile(
                  title: Text("Roles de usuario"),
                  selected: state.pageIndex == 2,
                  onTap: () {
                    context.read<DriverHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 2),
                    );
                    Navigator.pop(
                      context,
                    ); // redirect when user click in item of menu from drawer
                  },
                ),


                ListTile(
                  title: Text("Cerrar sesion"),
                  onTap: () {
                    context.read<DriverHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainApp()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      //! we need to register this new bloc in bloc_providers.dart file
      body: BlocBuilder<DriverHomeBloc, DriverHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
    );
  }
}
