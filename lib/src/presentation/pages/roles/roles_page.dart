import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/models/role.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/roles/bloc/roles_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/roles/bloc/roles_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/roles/roles_item.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RolesBloc, RolesState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 106),
                  Color.fromARGB(255, 30, 112, 227)
                ]
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: ListView( 
              shrinkWrap: true, // center 
              children: state.roles != null
                ? (state.roles?.map((Role role) {
                    return RolesItem(role);
                  }).toList()
              ) as List<Widget>
              : []
            ),
          );
        },
      ),
    );
  }
}