import 'package:equatable/equatable.dart';

class AppStates extends Equatable {
  @override
  List<Object> get props => [];
}

class AppLoadingState extends AppStates {}

class AppSuccessState extends AppStates {}

class AppFailureState extends AppStates {}
