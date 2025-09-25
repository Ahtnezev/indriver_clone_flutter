import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/profile_update_content.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => ProfileUpdatePageState();
}

class ProfileUpdatePageState extends State<ProfileUpdatePage> {
  User? user;

  @override
  Widget build(BuildContext context) {

    user =
        ModalRoute.of(context)?.settings.arguments
            as User; // receiving arguments

    return Scaffold(body: ProfileUpdateContent(user));
  }
}