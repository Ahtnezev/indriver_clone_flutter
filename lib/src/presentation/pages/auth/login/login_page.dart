import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_bloc.dart';
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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final response = state.response;
        if (response is ErrorData) {
          print("Error Data: ${response.message}");
        } else if (response is Success) {
          print("Success Data: ${response.data}");
        }
      },
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 24, 181, 254),
        body: BlocBuilder<LoginBloc, LoginState>(
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
