// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/features/app/app_module.dart' as _i5;
import '../../src/features/app/ui/cubit/app_cubit.dart' as _i3;
import '../../src/features/login/login_module.dart' as _i6;
import '../../src/features/login/ui/cubit/login_cubit.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final loginModule = _$LoginModule();
    gh.factory<_i3.AppCubit>(() => appModule.appCubit);
    gh.factory<_i4.LoginCubit>(() => loginModule.loginCubit);
    return this;
  }
}

class _$AppModule extends _i5.AppModule {}

class _$LoginModule extends _i6.LoginModule {}
