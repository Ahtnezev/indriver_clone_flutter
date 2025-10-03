import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone_flutter/bloc_providers.dart';
import 'package:indriver_clone_flutter/injection.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/login_page.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/register_page.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/home/client_home_page.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/profile_update_page.dart';

// to continue the course, we need go to: https://cloud.google.com/maps-platform/ and enable Maps SDK for Android and Maps SDK for iOS
// needs credit card:p
// Video 67: Seccion 10 Google Maps, min 4:30
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // registar mas de 2 
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage()
        },
        // home: LoginPage(),
      ),
    );
  }
}
