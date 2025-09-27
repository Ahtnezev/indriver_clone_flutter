import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';

class ProfileInfoContent extends StatelessWidget {
  User? user;

  ProfileInfoContent(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(context),
            Spacer(),
            _actionProfile("EDITAR PERFIL", Icons.edit, () {
              // arguments: to send data to another page
              Navigator.pushNamed(context, 'profile/update', arguments: user);
            }),
            _actionProfile("CERRAR SESION", Icons.settings_power, () {}),
            SizedBox(height: 35),
          ],
        ),
        _cardUserInfo(context),
      ],
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 85),
      width: MediaQuery.of(context).size.width,
      height: 320,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: 115,
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/img/my_user.png",
                    image:
                        "https://e7.pngegg.com/pngimages/552/1/png-clipart-dogs-dogs-thumbnail.png",
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            Text(
              '${user?.name} ${user?.lastname}', // ?? ''
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(user?.email ?? '', style: TextStyle(color: Colors.grey[700])),
            Text(user?.phone ?? '', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  // circular icon and styles
  Widget _actionProfile(String option, IconData icon, Function() function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 15),
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

  Widget _headerProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.35,
      width:
          MediaQuery.of(context).size.width, // or full width: double.infinity
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
        "PERFIL DE USUARIO",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
