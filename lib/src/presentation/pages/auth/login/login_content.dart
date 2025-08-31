import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_button.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/default_text_field.dart';

class LoginContent extends StatelessWidget {

  LoginState state;

  LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 12, 38, 145),
                  Color.fromARGB(255, 34, 156, 249)
                ]
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // horizontal
              mainAxisAlignment: MainAxisAlignment.center, // vertical
              children: [
      
               _textLoginRotated(),
                SizedBox(height: 50,),
      
                _textRegisterRotated(context),
                SizedBox(height: 90,),
              ],
            ),
          ),  
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 106),
                  Color.fromARGB(255, 30, 112, 227)
                ]
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), bottomLeft: Radius.circular(35))
            ),
            // height: MediaQuery.of(context).size.height * 0.93, // 93%
            // width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(left: 60, bottom: 60),
            child: Container(
              height: MediaQuery.of(context).size.height, // expandimos el container
              margin: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    _textWelcome('Welcome'),
                    _textWelcome('back...'),
                    _imageCar(),
                    _textLogin(),
                    
                    DefaultTextField(
                      text: 'Email',
                      icon: Icons.email_outlined,
                      onChanged: (text) {
                        context.read<LoginBloc>().add(EmailChanged(email: BlogFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.email.error;
                      },
                    ),
                    DefaultTextField(
                      text: 'Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                      onChanged: (text) {
                        context.read<LoginBloc>().add(PasswordChanged(password: BlogFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                    ),
                
                    // Spacer(), error con scrollview,
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
      
                    DefaultButton(
                      text: 'LOGIN',
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        } else {
                          print('Formulario no valido');
                        }
                        
                      },
                    ),
                    _separatorOr(),
                    SizedBox(height: 10),
                
                    _textDontHaveAccount(context),
                    SizedBox(height: 50),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿No tienes cuenta?', style: TextStyle(
            color: Colors.grey[100],
            fontSize: 16
            ),
          ),
      
          SizedBox(width: 7),
          
          Text('Registrate', style: TextStyle(
            color: Colors.grey[100],
            fontSize: 16,
            fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text('O', style: TextStyle(
          color: Colors.white,
          fontSize: 17
          ),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _imageCar(){
    return Container(
        alignment: Alignment.centerRight,
        child: Image.asset(
          'assets/img/car.png',
          width: 150,
          height: 150,
        ),
      );
  }

  Widget _textLogin() {
    return Text('Log in', style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      );
  }

  Widget _textWelcome(String text) {
    return Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1, // rotate the text
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

}