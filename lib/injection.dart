

import 'package:get_it/get_it.dart';
import 'package:indriver_clone_flutter/injection.config.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

// command: flutter packages pub run build_runner build
// this generate a injection.config.dart file
@injectableInit
Future<void> configureDependencies() async => await locator.init();