import 'package:bloc/bloc.dart';
import 'package:flutter_login/src/features/app/ui/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppLoadingState());

  void init() async {
    emit(AppLoadingState());

    await Future.delayed(const Duration(milliseconds: 10));

    emit(AppSuccessState());
  }
}
