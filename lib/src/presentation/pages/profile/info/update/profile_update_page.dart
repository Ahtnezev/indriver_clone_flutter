import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/profile_update_content.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => ProfileUpdatePageState();
}

class ProfileUpdatePageState extends State<ProfileUpdatePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    print("INIT STATEEEE: ");
    // Get the user data from the arguments, we avoid the null user
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      print("INIT STATE BINDING: ");
      context.read<ProfileUpdateBloc>().add(
        ProfileUpdateInitEvent(user: user),
      ); //user is null here
    });
  }

  @override
  Widget build(BuildContext context) {
    print("BUILDDD: ");
    user =
        ModalRoute.of(context)?.settings.arguments
            as User; // receiving arguments

    return Scaffold(
      body: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
        builder: (context, state) {
          return ProfileUpdateContent(state, user);
        },
      ),
    );
  }
}
