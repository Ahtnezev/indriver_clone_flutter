import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/home/bloc/client_home_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/home/bloc/client_home_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/profile_info_page.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[ProfileInfoPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu de opciones")),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
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
                    "Menu del cliente",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // to use pageIndex we need to access, needs envolve Drawer in a BlocBuilder...
                ListTile(
                  title: Text("Perfil del usuario"),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0),
                    );
                    Navigator.pop(
                      context,
                    ); // redirect when user click in item of menu from drawer
                  },
                ),
              ],
            ),
          );
        },
      ),
      //! we need to register this new bloc in bloc_providers.dart file
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
    );
  }
}
