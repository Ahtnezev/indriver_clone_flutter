// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indriver_clone_flutter/src/data/dataSource/local/sharefpref.dart'
    as _i129;
import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/auth_service.dart'
    as _i482;
import 'package:indriver_clone_flutter/src/di/app_module.dart' as _i253;
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart'
    as _i374;
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart'
    as _i387;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i129.SharefPref>(() => appModule.sharefPref);
    gh.factory<_i482.AuthService>(() => appModule.authService);
    gh.factory<_i374.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i387.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i253.AppModule {}
