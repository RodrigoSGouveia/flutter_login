import 'package:equatable/equatable.dart';

class LoginStates extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginFailureState extends LoginStates {}
