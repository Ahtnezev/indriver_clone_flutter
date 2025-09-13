import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 24, 181, 254),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            debugPrint("Error Data: ${response.message}");
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          } else if (response is Success) {
            debugPrint("Success Data: ${response.data}");
            final authResponse = response.data as AuthResponse;
            context.read<LoginBloc>().add(
              SaveUserSession(authResponse: authResponse),
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              'client/home',
              (route) => false,
            ); // no store history in screens 

          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final response = state.response;
            if (response is Loading) {
              return Stack(
                children: [
                  LoginContent(state),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return LoginContent(state);
          },
        ),
      ),
    );
  }
}
