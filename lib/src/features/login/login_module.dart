import 'package:flutter_login/src/features/login/ui/cubit/login_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LoginModule {
  @injectable
  LoginCubit get loginCubit => LoginCubit();
}
