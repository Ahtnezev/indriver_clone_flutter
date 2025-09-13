import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/profile_info_content.dart';


class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => ProfileInfoPageState();
}

class ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileInfoContent(),
    );
  }
}