import 'package:flutter_login/src/features/app/ui/cubit/app_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AppCubit get appCubit => AppCubit();
}
