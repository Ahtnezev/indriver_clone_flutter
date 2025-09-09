import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/register_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_SHORT,
            );
          } else if (response is Success) {
            final authResponse = response.data as AuthResponse;
            // clear the register form
            context.read<RegisterBloc>().add(
              FormReset(),
            );

            context.read<RegisterBloc>().add(
              SaveUserSession(authResponse: authResponse),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              'client/home',
              (route) => false,
            );
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return RegisterContent(state);
          },
        ),
      ),
    );
  }
}
