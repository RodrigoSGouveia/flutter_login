import 'package:bloc/bloc.dart';
import 'package:flutter_login/src/features/login/ui/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginLoadingState());

  void init() async {
    emit(LoginLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(LoginSuccessState());
  }
}
