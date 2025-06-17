import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_button.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_text_field.dart';


class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249)
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // pasar al izq (hori)
            mainAxisAlignment: MainAxisAlignment.center, // centrar vertical
            children: [
              _textLoginRotated(),
              SizedBox(height: 100),
              _textRegisterRotated(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 35), // allow visualize content login/registro
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35)
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color.fromARGB(255, 227, 225, 225),
                const Color.fromARGB(255, 170, 166, 166)
              ]
            )
          ),
          child: Column(
            children: [
              _imageBanner(),
              DefaultTextField(
                text: 'Nombre',
                icon: Icons.person_outline,
                margin: EdgeInsets.only(left: 50, right: 50, top: 15),
              ),
              DefaultTextField(
                text: 'Apellido',
                icon: Icons.person_2_outlined,
                margin: EdgeInsets.only(left: 50, right: 50, top: 15),
              ),
              DefaultTextField(
                text: 'Email',
                icon: Icons.email_outlined,
                margin: EdgeInsets.only(left: 50, right: 50, top: 15),
              ),
              DefaultTextField(
                text: 'Telefono',
                icon: Icons.phone_outlined,
                margin: EdgeInsets.only(left: 50, right: 50, top: 15),
              ),
              DefaultTextField(
                text: 'Password',
                icon: Icons.lock_outline,
                margin: EdgeInsets.only(left: 50, right: 50, top: 15),
              ),
              DefaultTextField(
                text: 'Confirmar password',
                icon: Icons.lock_outline,
                margin: EdgeInsets.only(left: 50, right: 50, top: 15),
              ),

              DefaultButton(
                text: 'Crear usuario',
                margin: EdgeInsets.only(top: 30, left: 60, right: 60)
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Image.asset('assets/img/delivery.png', width: 180, height: 180,),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1, // vertical
      child: Text('Login', style: TextStyle(fontSize: 24, color: Colors.white),)
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1, // vertical
      child: Text('Registro', style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold ),)
    );
  }
}